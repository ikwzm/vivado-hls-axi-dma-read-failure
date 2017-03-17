// DMA_Read_addr_tb.cpp
// 2016/07/15 by marsee
// 2017/03/16 : 3フレーム処理から1フレーム処理に変更
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <iostream>
#include <fstream>
#include <ap_axi_sdata.h>

#include "DMA_Read.h"
#include "bmp_header.h"

int DMA_Read_addr(volatile int *in, hls::stream<ap_axis<32,1,1,1> >& outs,
        unsigned int frame_buffer0, unsigned int frame_buffer1,
        unsigned int frame_buffer2,  ap_uint<2> & active_frame,
        ap_uint<1> mode);

int main()
{
    using namespace std;

    hls::stream<ap_axis<32,1,1,1> > outs_dummy;
    hls::stream<ap_axis<32,1,1,1> > outs;
    ap_axis<32,1,1,1> pix;
    ap_axis<32,1,1,1> vals, vals_dummy;

    BITMAPFILEHEADER bmpfhr; // BMPファイルのファイルヘッダ(for Read)
    BITMAPINFOHEADER bmpihr; // BMPファイルのINFOヘッダ(for Read)
    FILE *fbmpr, *fbmpw;
    int *rd_bmp, *hw_lapd;
    int blue, green, red;
    ap_uint<2> active_frame = 0;
    int *frame_buffer;

    if ((fbmpr = fopen("test.bmp", "rb")) == NULL){ // test.bmp をオープン
    //if ((fbmpr = fopen("road_1.bmp", "rb")) == NULL){ // test.bmp をオープン
        fprintf(stderr, "Can't open test.bmp by binary read mode\n");
        exit(1);
    }
    // bmpヘッダの読み出し
    fread(&bmpfhr.bfType, sizeof(char), 2, fbmpr);
    fread(&bmpfhr.bfSize, sizeof(long), 1, fbmpr);
    fread(&bmpfhr.bfReserved1, sizeof(short), 1, fbmpr);
    fread(&bmpfhr.bfReserved2, sizeof(short), 1, fbmpr);
    fread(&bmpfhr.bfOffBits, sizeof(long), 1, fbmpr);
    fread(&bmpihr, sizeof(BITMAPINFOHEADER), 1, fbmpr);

    // ピクセルを入れるメモリをアロケートする
    if ((rd_bmp =(int *)malloc(sizeof(int) * (bmpihr.biWidth * bmpihr.biHeight))) == NULL){
        fprintf(stderr, "Can't allocate rd_bmp memory\n");
        exit(1);
    }

    int *buf;
    if ((buf =(int *)malloc(3 * sizeof(int) * (bmpihr.biWidth * bmpihr.biHeight))) == NULL){
        fprintf(stderr, "Can't allocate buf memory\n");
        exit(1);
    }

    // rd_bmp にBMPのピクセルを代入。その際に、行を逆転する必要がある
    for (int y=0; y<bmpihr.biHeight; y++){
        for (int x=0; x<bmpihr.biWidth; x++){
            blue = fgetc(fbmpr);
            green = fgetc(fbmpr);
            red = fgetc(fbmpr);
            rd_bmp[((bmpihr.biHeight-1)-y)*bmpihr.biWidth+x] = (blue & 0xff) | ((green & 0xff)<<8) | ((red & 0xff)<<16);
        }
    }
    fclose(fbmpr);

    // frame buffer をアロケートする、3倍の領域を取ってそれを3つに分ける
    if ((frame_buffer =(int *)malloc(MAX_FRAME_NUMBER * sizeof(int) * (bmpihr.biWidth * bmpihr.biHeight))) == NULL){
        fprintf(stderr, "Can't allocate frame_buffer0 ~ 2\n");
        exit(1);
    }

    // 3 つのフレームバッファにそれぞれ'A' を入力する（1つに変更）
    memcpy(frame_buffer, rd_bmp, bmpihr.biHeight * bmpihr.biWidth * sizeof(int));

    memcpy((int *)((unsigned int)frame_buffer + bmpihr.biHeight * bmpihr.biWidth * sizeof(int)),
        rd_bmp, bmpihr.biHeight * bmpihr.biWidth * sizeof(int));

    memcpy((int *)((unsigned int)frame_buffer + 2 * bmpihr.biHeight * bmpihr.biWidth * sizeof(int)),
        rd_bmp, bmpihr.biHeight * bmpihr.biWidth * sizeof(int));

    DMA_Read_addr((volatile int *)0, outs_dummy, (unsigned int)frame_buffer,
        (unsigned int)frame_buffer+(bmpihr.biWidth * bmpihr.biHeight * sizeof(int)),
        (unsigned int)frame_buffer+(2 * (bmpihr.biWidth * bmpihr.biHeight) * sizeof(int)),
        active_frame, DMA_WRITE_MODE);

    DMA_Read_addr((volatile int *)0, outs, (unsigned int)frame_buffer,
        (unsigned int)frame_buffer+(bmpihr.biWidth * bmpihr.biHeight * sizeof(int)),
        (unsigned int)frame_buffer+(2 * (bmpihr.biWidth * bmpihr.biHeight) * sizeof(int)),
        active_frame, FREE_RUN_MODE);

    // outs ストリームのデータを buf に入力する
    //for (int k=0; k<3; k++){
        int k = 0;
        for(int j=0; j < bmpihr.biHeight; j++){
            for(int i=0; i < bmpihr.biWidth; i++){
                outs >> vals;
                outs_dummy >> vals_dummy;
                ap_int<32> val = vals.data;
                buf[(k*bmpihr.biWidth*bmpihr.biHeight)+(j*bmpihr.biWidth)+i] = (int)val;
            }
        }
    //}

    // DMAされたデータをBMPフィルに書き込む
    char output_file[] = "dma_result0.bmp";
    //for (int i=0; i<MAX_FRAME_NUMBER; i++){
        int i=0;
        switch (i){
            case 0:
                strcpy(output_file,"dma_result0.bmp");
                break;
            case 1:
                strcpy(output_file,"dma_result1.bmp");
                break;
            case 2:
                strcpy(output_file,"dma_result2.bmp");
                break;
        }
        if ((fbmpw=fopen(output_file, "wb")) == NULL){
            fprintf(stderr, "Can't open %s by binary write mode\n", output_file);
            exit(1);
        }
        // BMPファイルヘッダの書き込み
        fwrite(&bmpfhr.bfType, sizeof(char), 2, fbmpw);
        fwrite(&bmpfhr.bfSize, sizeof(long), 1, fbmpw);
        fwrite(&bmpfhr.bfReserved1, sizeof(short), 1, fbmpw);
        fwrite(&bmpfhr.bfReserved2, sizeof(short), 1, fbmpw);
        fwrite(&bmpfhr.bfOffBits, sizeof(long), 1, fbmpw);
        fwrite(&bmpihr, sizeof(BITMAPINFOHEADER), 1, fbmpw);

        // RGB データの書き込み、逆順にする
        int offset = i * bmpihr.biWidth * bmpihr.biHeight;
        for (int y=0; y<bmpihr.biHeight; y++){
            for (int x=0; x<bmpihr.biWidth; x++){
                blue = buf[offset+((bmpihr.biHeight-1)-y)*bmpihr.biWidth+x] & 0xff;
                green = (buf[offset+((bmpihr.biHeight-1)-y)*bmpihr.biWidth+x] >> 8) & 0xff;
                red = (buf[offset+((bmpihr.biHeight-1)-y)*bmpihr.biWidth+x]>>16) & 0xff;

                fputc(blue, fbmpw);
                fputc(green, fbmpw);
                fputc(red, fbmpw);
            }
        }
        fclose(fbmpw);
    //}
    free(rd_bmp);
    free(frame_buffer);
    return 0;
}
