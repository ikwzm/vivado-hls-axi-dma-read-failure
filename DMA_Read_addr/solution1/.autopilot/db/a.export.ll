; ModuleID = 'H:/work/marsee101-axi-dma-read/DMA_Read_addr/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@n = internal unnamed_addr global i32 0, align 4
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@DMA_Read_addr_str = internal unnamed_addr constant [14 x i8] c"DMA_Read_addr\00"
@p_str7 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str6 = private unnamed_addr constant [5 x i8] c"both\00", align 1
@p_str5 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str4 = private unnamed_addr constant [4 x i8] c"off\00", align 1
@p_str3 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32*, i4*, i4*, i1*, i1*, i1*, i1*, i32, i4, i4, i1, i1, i1, i1) {
entry:
  store i32 %7, i32* %0
  store i4 %8, i4* %1
  store i4 %9, i4* %2
  store i1 %10, i1* %3
  store i1 %11, i1* %4
  store i1 %12, i1* %5
  store i1 %13, i1* %6
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i1 @_ssdm_op_ReadReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

define weak i32 @_ssdm_op_Read.s_axilite.i32(i32) {
entry:
  ret i32 %0
}

define weak i1 @_ssdm_op_Read.s_axilite.i1(i1) {
entry:
  ret i1 %0
}

define weak i32 @_ssdm_op_Read.m_axi.i32P(i32*) {
entry:
  %empty = load i32* %0
  ret i32 %empty
}

define weak i2 @_ssdm_op_Read.ap_none.i2P(i2*) {
entry:
  %empty = load i2* %0
  ret i2 %empty
}

define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_4 = trunc i32 %empty to i30
  ret i30 %empty_4
}

declare void @_GLOBAL__I_a() nounwind

define i32 @DMA_Read_addr(i32* %in_r, i32* %outs_V_data_V, i4* %outs_V_keep_V, i4* %outs_V_strb_V, i1* %outs_V_user_V, i1* %outs_V_last_V, i1* %outs_V_id_V, i1* %outs_V_dest_V, i32 %frame_buffer0, i32 %frame_buffer1, i32 %frame_buffer2, i2* %active_frame_V, i1 %mode_V) {
_ifconv:
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_r), !map !46
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %outs_V_data_V), !map !52
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %outs_V_keep_V), !map !56
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %outs_V_strb_V), !map !60
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %outs_V_user_V), !map !64
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %outs_V_last_V), !map !68
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %outs_V_id_V), !map !72
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %outs_V_dest_V), !map !76
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %frame_buffer0), !map !80
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %frame_buffer1), !map !86
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %frame_buffer2), !map !90
  call void (...)* @_ssdm_op_SpecBitsMap(i2* %active_frame_V), !map !94
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %mode_V), !map !98
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !102
  call void (...)* @_ssdm_op_SpecTopModule([14 x i8]* @DMA_Read_addr_str) nounwind
  %mode_V_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %mode_V)
  %frame_buffer2_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %frame_buffer2)
  %frame_buffer1_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %frame_buffer1)
  %frame_buffer0_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %frame_buffer0)
  call void (...)* @_ssdm_op_SpecInterface(i1 %mode_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i2* %active_frame_V, [8 x i8]* @p_str2, i32 1, i32 1, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %frame_buffer0, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %frame_buffer1, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %frame_buffer2, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %in_r, [6 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 3072, [1 x i8]* @p_str1, [4 x i8]* @p_str4, [1 x i8]* @p_str1, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %outs_V_data_V, i4* %outs_V_keep_V, i4* %outs_V_strb_V, i1* %outs_V_user_V, i1* %outs_V_last_V, i1* %outs_V_id_V, i1* %outs_V_dest_V, [5 x i8]* @p_str5, i32 1, i32 1, [5 x i8]* @p_str6, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %n_load = load i32* @n, align 4
  %tmp = add nsw i32 %n_load, 1
  %tmp_1 = icmp sgt i32 %tmp, 2
  %p_s = select i1 %tmp_1, i32 0, i32 %tmp
  %active_frame_V_read = call i2 @_ssdm_op_Read.ap_none.i2P(i2* %active_frame_V)
  %tmp_2 = zext i2 %active_frame_V_read to i32
  %storemerge = select i1 %mode_V_read, i32 %p_s, i32 %tmp_2
  store i32 %storemerge, i32* @n, align 4
  %tmp_4 = icmp eq i32 %storemerge, 0
  %tmp_9 = icmp eq i32 %storemerge, 1
  %tmp_s = icmp eq i32 %storemerge, 2
  %or_cond = or i1 %tmp_s, %tmp_9
  %tmp_3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %frame_buffer1_read, i32 2, i32 31)
  %tmp_5 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %frame_buffer0_read, i32 2, i32 31)
  %tmp_6 = select i1 %tmp_s, i30 %tmp_3, i30 %tmp_5
  %tmp_8 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %frame_buffer2_read, i32 2, i32 31)
  %tmp_12 = select i1 %tmp_4, i30 %tmp_8, i30 %tmp_5
  %p_v = select i1 %or_cond, i30 %tmp_6, i30 %tmp_12
  %tmp_10 = zext i30 %p_v to i32
  %in_addr = getelementptr inbounds i32* %in_r, i32 %tmp_10
  %in_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %in_addr, i32 480000)
  br label %.preheader

.preheader:                                       ; preds = %_ifconv, %.preheader.preheader
  %indvar_flatten = phi i19 [ 0, %_ifconv ], [ %indvar_flatten_next, %.preheader.preheader ]
  %y = phi i10 [ 0, %_ifconv ], [ %tmp_3_cast8_mid2_v_v_1, %.preheader.preheader ]
  %x = phi i10 [ 0, %_ifconv ], [ %x_1, %.preheader.preheader ]
  %exitcond_flatten = icmp eq i19 %indvar_flatten, -44288
  %indvar_flatten_next = add i19 %indvar_flatten, 1
  br i1 %exitcond_flatten, label %0, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 480000, i64 480000, i64 480000)
  %exitcond4 = icmp eq i10 %x, -224
  %x_mid2 = select i1 %exitcond4, i10 0, i10 %x
  %y_s = add i10 %y, 1
  %tmp_3_cast8_mid2_v_v_1 = select i1 %exitcond4, i10 %y_s, i10 %y
  %tmp_11 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str7)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp_data_V = call i32 @_ssdm_op_Read.m_axi.i32P(i32* %in_addr)
  %tmp_7 = or i10 %x_mid2, %tmp_3_cast8_mid2_v_v_1
  %pix_user_V = icmp eq i10 %tmp_7, 0
  %pix_last_V = icmp eq i10 %x_mid2, -225
  call void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32* %outs_V_data_V, i4* %outs_V_keep_V, i4* %outs_V_strb_V, i1* %outs_V_user_V, i1* %outs_V_last_V, i1* %outs_V_id_V, i1* %outs_V_dest_V, i32 %tmp_data_V, i4 undef, i4 undef, i1 %pix_user_V, i1 %pix_last_V, i1 undef, i1 undef)
  %empty_5 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str7, i32 %tmp_11)
  %x_1 = add i10 %x_mid2, 1
  br label %.preheader

; <label>:0                                       ; preds = %.preheader
  ret i32 0
}

!opencl.kernels = !{!0, !7, !13, !15, !15, !18, !18, !24, !15, !15, !18, !18, !27, !18, !29, !35, !35, !37, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!39}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int*", metadata !"hls::stream<ap_axis<32, 1, 1, 1> > &", metadata !"uint", metadata !"uint", metadata !"uint", metadata !"ap_uint<2> &", metadata !"ap_uint<1>"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"volatile", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"in", metadata !"outs", metadata !"frame_buffer0", metadata !"frame_buffer1", metadata !"frame_buffer2", metadata !"active_frame", metadata !"mode"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_axis<32, 1, 1, 1> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"wdata"}
!13 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !14, metadata !6}
!14 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!15 = metadata !{null, metadata !8, metadata !9, metadata !16, metadata !11, metadata !17, metadata !6}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!17 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!18 = metadata !{null, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !6}
!19 = metadata !{metadata !"kernel_arg_addr_space"}
!20 = metadata !{metadata !"kernel_arg_access_qual"}
!21 = metadata !{metadata !"kernel_arg_type"}
!22 = metadata !{metadata !"kernel_arg_type_qual"}
!23 = metadata !{metadata !"kernel_arg_name"}
!24 = metadata !{null, metadata !8, metadata !9, metadata !25, metadata !11, metadata !26, metadata !6}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!27 = metadata !{null, metadata !8, metadata !9, metadata !28, metadata !11, metadata !26, metadata !6}
!28 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<32> &"}
!29 = metadata !{null, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !6}
!30 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!31 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!32 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"int"}
!33 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!34 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!35 = metadata !{null, metadata !8, metadata !9, metadata !16, metadata !11, metadata !36, metadata !6}
!36 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!37 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !26, metadata !6}
!38 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!39 = metadata !{metadata !40, [1 x i32]* @llvm_global_ctors_0}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 31, metadata !42}
!42 = metadata !{metadata !43}
!43 = metadata !{metadata !"llvm.global_ctors.0", metadata !44, metadata !"", i32 0, i32 31}
!44 = metadata !{metadata !45}
!45 = metadata !{i32 0, i32 0, i32 1}
!46 = metadata !{metadata !47}
!47 = metadata !{i32 0, i32 31, metadata !48}
!48 = metadata !{metadata !49}
!49 = metadata !{metadata !"in", metadata !50, metadata !"int", i32 0, i32 31}
!50 = metadata !{metadata !51}
!51 = metadata !{i32 0, i32 3071, i32 1}
!52 = metadata !{metadata !53}
!53 = metadata !{i32 0, i32 31, metadata !54}
!54 = metadata !{metadata !55}
!55 = metadata !{metadata !"outs.V.data.V", metadata !44, metadata !"int32", i32 0, i32 31}
!56 = metadata !{metadata !57}
!57 = metadata !{i32 0, i32 3, metadata !58}
!58 = metadata !{metadata !59}
!59 = metadata !{metadata !"outs.V.keep.V", metadata !44, metadata !"uint4", i32 0, i32 3}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 0, i32 3, metadata !62}
!62 = metadata !{metadata !63}
!63 = metadata !{metadata !"outs.V.strb.V", metadata !44, metadata !"uint4", i32 0, i32 3}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 0, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"outs.V.user.V", metadata !44, metadata !"uint1", i32 0, i32 0}
!68 = metadata !{metadata !69}
!69 = metadata !{i32 0, i32 0, metadata !70}
!70 = metadata !{metadata !71}
!71 = metadata !{metadata !"outs.V.last.V", metadata !44, metadata !"uint1", i32 0, i32 0}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 0, i32 0, metadata !74}
!74 = metadata !{metadata !75}
!75 = metadata !{metadata !"outs.V.id.V", metadata !44, metadata !"uint1", i32 0, i32 0}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 0, i32 0, metadata !78}
!78 = metadata !{metadata !79}
!79 = metadata !{metadata !"outs.V.dest.V", metadata !44, metadata !"uint1", i32 0, i32 0}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 0, i32 31, metadata !82}
!82 = metadata !{metadata !83}
!83 = metadata !{metadata !"frame_buffer0", metadata !84, metadata !"unsigned int", i32 0, i32 31}
!84 = metadata !{metadata !85}
!85 = metadata !{i32 0, i32 0, i32 0}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 0, i32 31, metadata !88}
!88 = metadata !{metadata !89}
!89 = metadata !{metadata !"frame_buffer1", metadata !84, metadata !"unsigned int", i32 0, i32 31}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 0, i32 31, metadata !92}
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !"frame_buffer2", metadata !84, metadata !"unsigned int", i32 0, i32 31}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 0, i32 1, metadata !96}
!96 = metadata !{metadata !97}
!97 = metadata !{metadata !"active_frame.V", metadata !44, metadata !"uint2", i32 0, i32 1}
!98 = metadata !{metadata !99}
!99 = metadata !{i32 0, i32 0, metadata !100}
!100 = metadata !{metadata !101}
!101 = metadata !{metadata !"mode.V", metadata !84, metadata !"uint1", i32 0, i32 0}
!102 = metadata !{metadata !103}
!103 = metadata !{i32 0, i32 31, metadata !104}
!104 = metadata !{metadata !105}
!105 = metadata !{metadata !"return", metadata !106, metadata !"int", i32 0, i32 31}
!106 = metadata !{metadata !107}
!107 = metadata !{i32 0, i32 1, i32 0}
