// DMA_Read_addr.cpp
// 2016/07/13 by marsee
//
// frame_buffer0, frame_buffer1, frame_buffer2 には3つのフレー�?バッファのアドレスを�?�れる
// mode = 0 : DMA Write IP の active_frame を見て、その1つ前�?�フレー�?をDMA Readするモー�?(DMA_WRITE_MODE)
// mode = 1 : フリーラン モー�?(FREE_RUN_MODE)
//
// 2017/03/15 : 1フレー�?�?のDMAに変更
//

#include <stdio.h>
#include <string.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

#include "DMA_Read.h"

int DMA_Read_addr(volatile int *in, hls::stream<ap_axis<32,1,1,1> >& outs,
        unsigned int frame_buffer0, unsigned int frame_buffer1,
        unsigned int frame_buffer2, ap_uint<2> & active_frame,
        ap_uint<1> mode){
#pragma HLS INTERFACE s_axilite port=mode
#pragma HLS INTERFACE ap_none register port=active_frame
#pragma HLS INTERFACE s_axilite port=frame_buffer0
#pragma HLS INTERFACE s_axilite port=frame_buffer1
#pragma HLS INTERFACE s_axilite port=frame_buffer2
#pragma HLS INTERFACE m_axi depth=3072 port=in offset=off
#pragma HLS INTERFACE axis port=outs
#pragma HLS INTERFACE s_axilite port=return

    ap_axis<32,1,1,1> pix;
    int dma_index;
    static int n = 0;

    if (mode == DMA_WRITE_MODE){
        n = (int)active_frame;
    }else{
        n++;
        if (n > 2)
            n = 0;
    }

    switch (n){ // 1つ前�?�フレー�?バッファを読み�?�?
        case 0 :
            dma_index = frame_buffer2/sizeof(int);
            break;
        case 1 :
            dma_index = frame_buffer0/sizeof(int);
            break;
        case 2 :
            dma_index = frame_buffer1/sizeof(int);
            break;
        default :
            dma_index = frame_buffer0/sizeof(int);
            break;
    }

    for (int y=0; y<VERTICAL_PIXEL_WIDTH; y++){
        for (int x=0; x<HORIZONTAL_PIXEL_WIDTH; x++){
#pragma HLS PIPELINE II=1
            pix.data = in[dma_index+(y*HORIZONTAL_PIXEL_WIDTH)+x];

            if (y==0 && x==0)
                pix.user = 1;
            else
                pix.user = 0;

            if (x == (HORIZONTAL_PIXEL_WIDTH-1))
                pix.last = 1;
            else
                pix.last = 0;

            outs << pix;
        }
    }

    return 0;
}

