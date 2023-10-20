; ModuleID = 'af_xdp_kern.c'
source_filename = "af_xdp_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.5 = type { [1 x i32]*, %struct.Key*, i32*, [64 x i32]* }
%struct.Key = type { i32, [16 x i8], i16 }
%struct.anon.6 = type { [17 x i32]*, i32*, i32*, [64 x i32]* }
%struct.anon.7 = type { [6 x i32]*, i32*, %struct.datarec*, [5 x i32]* }
%struct.datarec = type { i64, i64 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@xdp_sock_prog.____fmt = internal constant [28 x i8] c"Key: ip_addr=%u, ipv6_addr=\00", align 1, !dbg !0
@xdp_sock_prog.____fmt.1 = internal constant [5 x i8] c"%02x\00", align 1, !dbg !35
@xdp_sock_prog.____fmt.2 = internal constant [2 x i8] c":\00", align 1, !dbg !42
@xdp_sock_prog.____fmt.3 = internal constant [15 x i8] c", port_num=%u\0A\00", align 1, !dbg !47
@xdp_filter_map = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !97
@xsks_map = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !81
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !52
@xdp_stats_map = dso_local global %struct.anon.7 zeroinitializer, section ".maps", align 8, !dbg !57
@llvm.compiler.used = appending global [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.5* @xdp_filter_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_sock_prog to i8*), i8* bitcast (%struct.anon.7* @xdp_stats_map to i8*), i8* bitcast (%struct.anon.6* @xsks_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_sock_prog(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp" !dbg !2 {
  %2 = alloca %struct.Key, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !140, metadata !DIExpression()), !dbg !245
  %3 = bitcast %struct.Key* %2 to i8*, !dbg !246
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #6, !dbg !246
  call void @llvm.dbg.declare(metadata %struct.Key* %2, metadata !141, metadata !DIExpression()), !dbg !247
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(24) %3, i8 0, i64 24, i1 false), !dbg !247
  call void @llvm.dbg.value(metadata %struct.ethhdr* null, metadata !147, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata %struct.iphdr* null, metadata !158, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* null, metadata !187, metadata !DIExpression()), !dbg !245
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !248
  %5 = load i32, i32* %4, align 4, !dbg !248, !tbaa !249
  %6 = zext i32 %5 to i64, !dbg !254
  %7 = inttoptr i64 %6 to i8*, !dbg !255
  call void @llvm.dbg.value(metadata i8* %7, metadata !142, metadata !DIExpression()), !dbg !245
  %8 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 2) #6, !dbg !256
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !257
  %10 = load i32, i32* %9, align 4, !dbg !257, !tbaa !258
  %11 = zext i32 %10 to i64, !dbg !259
  %12 = inttoptr i64 %11 to i8*, !dbg !260
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !261, metadata !DIExpression()) #6, !dbg !270
  call void @llvm.dbg.value(metadata i8* %12, metadata !268, metadata !DIExpression()) #6, !dbg !270
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !269, metadata !DIExpression()) #6, !dbg !270
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !272, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i8* %12, metadata !282, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !283, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !284, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i8* %7, metadata !285, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i32 14, metadata !286, metadata !DIExpression()) #6, !dbg !295
  %13 = getelementptr i8, i8* %7, i64 14, !dbg !297
  %14 = icmp ugt i8* %13, %12, !dbg !299
  br i1 %14, label %149, label %15, !dbg !300

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %7, metadata !285, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i8* %13, metadata !142, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata i8* %13, metadata !287, metadata !DIExpression()) #6, !dbg !295
  %16 = getelementptr inbounds i8, i8* %7, i64 12, !dbg !301
  %17 = bitcast i8* %16 to i16*, !dbg !301
  call void @llvm.dbg.value(metadata i16 undef, metadata !293, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i32 0, metadata !294, metadata !DIExpression()) #6, !dbg !295
  %18 = load i16, i16* %17, align 1, !dbg !295, !tbaa !302
  call void @llvm.dbg.value(metadata i16 %18, metadata !293, metadata !DIExpression()) #6, !dbg !295
  %19 = inttoptr i64 %11 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %18, metadata !304, metadata !DIExpression()) #6, !dbg !309
  %20 = icmp eq i16 %18, 129, !dbg !315
  %21 = icmp eq i16 %18, -22392, !dbg !316
  %22 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %20) #6
  %23 = or i1 %21, %22, !dbg !316
  %24 = xor i1 %23, true, !dbg !317
  %25 = getelementptr i8, i8* %7, i64 18
  %26 = bitcast i8* %25 to %struct.vlan_hdr*
  %27 = icmp ugt %struct.vlan_hdr* %26, %19
  %28 = select i1 %24, i1 true, i1 %27, !dbg !318
  br i1 %28, label %46, label %29, !dbg !318

29:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i16 undef, metadata !293, metadata !DIExpression()) #6, !dbg !295
  %30 = getelementptr i8, i8* %7, i64 16, !dbg !319
  %31 = bitcast i8* %30 to i16*, !dbg !319
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %26, metadata !287, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i32 1, metadata !294, metadata !DIExpression()) #6, !dbg !295
  %32 = load i16, i16* %31, align 1, !dbg !295, !tbaa !302
  call void @llvm.dbg.value(metadata i16 %32, metadata !293, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i16 %32, metadata !304, metadata !DIExpression()) #6, !dbg !309
  %33 = icmp eq i16 %32, 129, !dbg !315
  %34 = icmp eq i16 %32, -22392, !dbg !316
  %35 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %33) #6
  %36 = or i1 %34, %35, !dbg !316
  %37 = xor i1 %36, true, !dbg !317
  %38 = getelementptr i8, i8* %7, i64 22
  %39 = bitcast i8* %38 to %struct.vlan_hdr*
  %40 = icmp ugt %struct.vlan_hdr* %39, %19
  %41 = select i1 %37, i1 true, i1 %40, !dbg !318
  br i1 %41, label %46, label %42, !dbg !318

42:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i16 undef, metadata !293, metadata !DIExpression()) #6, !dbg !295
  %43 = getelementptr i8, i8* %7, i64 20, !dbg !319
  %44 = bitcast i8* %43 to i16*, !dbg !319
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %39, metadata !287, metadata !DIExpression()) #6, !dbg !295
  call void @llvm.dbg.value(metadata i32 2, metadata !294, metadata !DIExpression()) #6, !dbg !295
  %45 = load i16, i16* %44, align 1, !dbg !295, !tbaa !302
  call void @llvm.dbg.value(metadata i16 %45, metadata !293, metadata !DIExpression()) #6, !dbg !295
  br label %46

46:                                               ; preds = %15, %29, %42
  %47 = phi i8* [ %13, %15 ], [ %25, %29 ], [ %38, %42 ], !dbg !295
  %48 = phi i16 [ %18, %15 ], [ %32, %29 ], [ %45, %42 ], !dbg !295
  call void @llvm.dbg.value(metadata i8* %47, metadata !142, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata i16 %48, metadata !227, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !245
  switch i16 %48, label %149 [
    i16 -8826, label %66
    i16 8, label %49
  ], !dbg !320

49:                                               ; preds = %46
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !321, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.value(metadata i8* %12, metadata !327, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !328, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.value(metadata i8* %47, metadata !329, metadata !DIExpression()), !dbg !331
  %50 = getelementptr inbounds i8, i8* %47, i64 20, !dbg !334
  %51 = icmp ugt i8* %50, %12, !dbg !336
  br i1 %51, label %149, label %52, !dbg !337

52:                                               ; preds = %49
  %53 = load i8, i8* %47, align 4, !dbg !338
  %54 = shl i8 %53, 2, !dbg !339
  %55 = and i8 %54, 60, !dbg !339
  call void @llvm.dbg.value(metadata i8 %55, metadata !330, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !331
  %56 = icmp ult i8 %55, 20, !dbg !340
  br i1 %56, label %149, label %57, !dbg !342

57:                                               ; preds = %52
  %58 = zext i8 %55 to i64
  call void @llvm.dbg.value(metadata i64 %58, metadata !330, metadata !DIExpression()), !dbg !331
  %59 = getelementptr i8, i8* %47, i64 %58, !dbg !343
  %60 = icmp ugt i8* %59, %12, !dbg !345
  br i1 %60, label %149, label %61, !dbg !346

61:                                               ; preds = %57
  call void @llvm.dbg.value(metadata i8* %59, metadata !142, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata i8 undef, metadata !228, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !245
  call void @llvm.dbg.value(metadata i8* %47, metadata !158, metadata !DIExpression()), !dbg !245
  %62 = getelementptr inbounds i8, i8* %47, i64 12, !dbg !347
  %63 = bitcast i8* %62 to i32*, !dbg !347
  %64 = load i32, i32* %63, align 4, !dbg !347, !tbaa !348
  %65 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 0, !dbg !349
  store i32 %64, i32* %65, align 4, !dbg !350, !tbaa !351
  br label %121, !dbg !353

66:                                               ; preds = %46
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !354, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %12, metadata !360, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !361, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %47, metadata !362, metadata !DIExpression()), !dbg !363
  %67 = getelementptr inbounds i8, i8* %47, i64 40, !dbg !365
  %68 = bitcast i8* %67 to %struct.ipv6hdr*, !dbg !365
  %69 = inttoptr i64 %11 to %struct.ipv6hdr*, !dbg !367
  %70 = icmp ugt %struct.ipv6hdr* %68, %69, !dbg !368
  br i1 %70, label %149, label %71, !dbg !369

71:                                               ; preds = %66
  %72 = getelementptr inbounds i8, i8* %47, i64 8
  call void @llvm.dbg.value(metadata i32 0, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 0, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %73 = load i8, i8* %72, align 1, !dbg !371, !tbaa !348
  %74 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 0, !dbg !374
  store i8 %73, i8* %74, align 4, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 1, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 1, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %75 = getelementptr inbounds i8, i8* %47, i64 9, !dbg !371
  %76 = load i8, i8* %75, align 1, !dbg !371, !tbaa !348
  %77 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 1, !dbg !374
  store i8 %76, i8* %77, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 2, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 2, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %78 = getelementptr inbounds i8, i8* %47, i64 10, !dbg !371
  %79 = load i8, i8* %78, align 1, !dbg !371, !tbaa !348
  %80 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 2, !dbg !374
  store i8 %79, i8* %80, align 2, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 3, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 3, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %81 = getelementptr inbounds i8, i8* %47, i64 11, !dbg !371
  %82 = load i8, i8* %81, align 1, !dbg !371, !tbaa !348
  %83 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 3, !dbg !374
  store i8 %82, i8* %83, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 4, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 4, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %84 = getelementptr inbounds i8, i8* %47, i64 12, !dbg !371
  %85 = load i8, i8* %84, align 1, !dbg !371, !tbaa !348
  %86 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 4, !dbg !374
  store i8 %85, i8* %86, align 4, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 5, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 5, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %87 = getelementptr inbounds i8, i8* %47, i64 13, !dbg !371
  %88 = load i8, i8* %87, align 1, !dbg !371, !tbaa !348
  %89 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 5, !dbg !374
  store i8 %88, i8* %89, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 6, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 6, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %90 = getelementptr inbounds i8, i8* %47, i64 14, !dbg !371
  %91 = load i8, i8* %90, align 1, !dbg !371, !tbaa !348
  %92 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 6, !dbg !374
  store i8 %91, i8* %92, align 2, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 7, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 7, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %93 = getelementptr inbounds i8, i8* %47, i64 15, !dbg !371
  %94 = load i8, i8* %93, align 1, !dbg !371, !tbaa !348
  %95 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 7, !dbg !374
  store i8 %94, i8* %95, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 8, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 8, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %96 = getelementptr inbounds i8, i8* %47, i64 16, !dbg !371
  %97 = load i8, i8* %96, align 1, !dbg !371, !tbaa !348
  %98 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 8, !dbg !374
  store i8 %97, i8* %98, align 4, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 9, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 9, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %99 = getelementptr inbounds i8, i8* %47, i64 17, !dbg !371
  %100 = load i8, i8* %99, align 1, !dbg !371, !tbaa !348
  %101 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 9, !dbg !374
  store i8 %100, i8* %101, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 10, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 10, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %102 = getelementptr inbounds i8, i8* %47, i64 18, !dbg !371
  %103 = load i8, i8* %102, align 1, !dbg !371, !tbaa !348
  %104 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 10, !dbg !374
  store i8 %103, i8* %104, align 2, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 11, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 11, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %105 = getelementptr inbounds i8, i8* %47, i64 19, !dbg !371
  %106 = load i8, i8* %105, align 1, !dbg !371, !tbaa !348
  %107 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 11, !dbg !374
  store i8 %106, i8* %107, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 12, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 12, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %108 = getelementptr inbounds i8, i8* %47, i64 20, !dbg !371
  %109 = load i8, i8* %108, align 1, !dbg !371, !tbaa !348
  %110 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 12, !dbg !374
  store i8 %109, i8* %110, align 4, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 13, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 13, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %111 = getelementptr inbounds i8, i8* %47, i64 21, !dbg !371
  %112 = load i8, i8* %111, align 1, !dbg !371, !tbaa !348
  %113 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 13, !dbg !374
  store i8 %112, i8* %113, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 14, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 14, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %114 = getelementptr inbounds i8, i8* %47, i64 22, !dbg !371
  %115 = load i8, i8* %114, align 1, !dbg !371, !tbaa !348
  %116 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 14, !dbg !374
  store i8 %115, i8* %116, align 2, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 15, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i64 15, metadata !229, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %47, metadata !187, metadata !DIExpression()), !dbg !245
  %117 = getelementptr inbounds i8, i8* %47, i64 23, !dbg !371
  %118 = load i8, i8* %117, align 1, !dbg !371, !tbaa !348
  %119 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 15, !dbg !374
  store i8 %118, i8* %119, align 1, !dbg !375, !tbaa !348
  call void @llvm.dbg.value(metadata i64 16, metadata !229, metadata !DIExpression()), !dbg !370
  %120 = zext i8 %73 to i32, !dbg !376
  br label %121, !dbg !376

121:                                              ; preds = %71, %61
  %122 = phi i32 [ %120, %71 ], [ 0, %61 ]
  %123 = phi i32 [ 0, %71 ], [ %64, %61 ], !dbg !376
  %124 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @xdp_sock_prog.____fmt, i64 0, i64 0), i32 noundef 28, i32 noundef %123) #6, !dbg !376
  call void @llvm.dbg.value(metadata i32 0, metadata !234, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i64 0, metadata !234, metadata !DIExpression()), !dbg !378
  %125 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_sock_prog.____fmt.1, i64 0, i64 0), i32 noundef 5, i32 noundef %122) #6, !dbg !379
  br label %130, !dbg !383

126:                                              ; preds = %130
  call void @llvm.dbg.value(metadata i64 %133, metadata !234, metadata !DIExpression()), !dbg !378
  %127 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @xdp_sock_prog.____fmt.3, i64 0, i64 0), i32 noundef 15, i32 noundef 0) #6, !dbg !384
  %128 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.5* @xdp_filter_map to i8*), i8* noundef nonnull %3) #6, !dbg !386
  call void @llvm.dbg.value(metadata i8* %128, metadata !236, metadata !DIExpression()), !dbg !245
  %129 = icmp eq i8* %128, null, !dbg !387
  br i1 %129, label %149, label %139, !dbg !389

130:                                              ; preds = %121, %130
  %131 = phi i64 [ 0, %121 ], [ %133, %130 ]
  call void @llvm.dbg.value(metadata i64 %131, metadata !234, metadata !DIExpression()), !dbg !378
  %132 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @xdp_sock_prog.____fmt.2, i64 0, i64 0), i32 noundef 2) #6, !dbg !390
  %133 = add nuw nsw i64 %131, 1, !dbg !394
  call void @llvm.dbg.value(metadata i64 %133, metadata !234, metadata !DIExpression()), !dbg !378
  %134 = getelementptr inbounds %struct.Key, %struct.Key* %2, i64 0, i32 1, i64 %133
  %135 = load i8, i8* %134, align 1, !dbg !379, !tbaa !348
  %136 = zext i8 %135 to i32, !dbg !379
  %137 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_sock_prog.____fmt.1, i64 0, i64 0), i32 noundef 5, i32 noundef %136) #6, !dbg !379
  %138 = icmp eq i64 %133, 15, !dbg !395
  br i1 %138, label %126, label %130, !dbg !383

139:                                              ; preds = %126
  %140 = bitcast i8* %128 to i32*, !dbg !386
  call void @llvm.dbg.value(metadata i32* %140, metadata !236, metadata !DIExpression()), !dbg !245
  %141 = load i32, i32* %140, align 4, !dbg !396, !tbaa !398
  %142 = icmp eq i32 %141, 4, !dbg !399
  br i1 %142, label %143, label %149, !dbg !400

143:                                              ; preds = %139
  %144 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 4, !dbg !401
  %145 = load i32, i32* %144, align 4, !dbg !401, !tbaa !402
  %146 = zext i32 %145 to i64, !dbg !403
  %147 = call i64 inttoptr (i64 51 to i64 (i8*, i64, i64)*)(i8* noundef bitcast (%struct.anon.6* @xsks_map to i8*), i64 noundef %146, i64 noundef 0) #6, !dbg !404
  %148 = trunc i64 %147 to i32, !dbg !404
  br label %149, !dbg !405

149:                                              ; preds = %66, %57, %52, %49, %1, %143, %126, %139, %46
  %150 = phi i32 [ 2, %46 ], [ %148, %143 ], [ 2, %126 ], [ 2, %139 ], [ 2, %1 ], [ 2, %49 ], [ 2, %52 ], [ 2, %57 ], [ 2, %66 ], !dbg !245
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #6, !dbg !406
  ret i32 %150, !dbg !406
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!240, !241, !242, !243}
!llvm.ident = !{!244}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 82, type: !237, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_sock_prog", scope: !3, file: !3, line: 38, type: !4, scopeLine: 39, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !139)
!3 = !DIFile(filename: "af_xdp_kern.c", directory: "/home/nir_ophir/xdp-tutorial/af_xdp_our", checksumkind: CSK_MD5, checksum: "9a427630e2a9162eb69c216252c57850")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !9, line: 5442, size: 192, elements: !10)
!9 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "5ad8bc925dae1ec87bbb04b3148b183b")
!10 = !{!11, !15, !16, !17, !18, !19}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 5443, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 5444, baseType: !12, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 5445, baseType: !12, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 5447, baseType: !12, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !8, file: !9, line: 5448, baseType: !12, size: 32, offset: 128)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !8, file: !9, line: 5450, baseType: !12, size: 32, offset: 160)
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !29, globals: !34, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 5431, baseType: !14, size: 32, elements: !23)
!23 = !{!24, !25, !26, !27, !28}
!24 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!25 = !DIEnumerator(name: "XDP_DROP", value: 1)
!26 = !DIEnumerator(name: "XDP_PASS", value: 2)
!27 = !DIEnumerator(name: "XDP_TX", value: 3)
!28 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!29 = !{!30, !31, !32}
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!31 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !33)
!33 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!34 = !{!0, !35, !42, !47, !52, !57, !81, !97, !120, !127, !134}
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 85, type: !37, isLocal: true, isDefinition: true)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 40, elements: !40)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!39 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!40 = !{!41}
!41 = !DISubrange(count: 5)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 87, type: !44, isLocal: true, isDefinition: true)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 16, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 2)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 91, type: !49, isLocal: true, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 120, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 15)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "_license", scope: !20, file: !3, line: 105, type: !54, isLocal: false, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 32, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 4)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !20, file: !59, line: 21, type: !60, isLocal: false, isDefinition: true)
!59 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/nir_ophir/xdp-tutorial/af_xdp_our", checksumkind: CSK_MD5, checksum: "2ed732331d6abc83898e83bb58b37126")
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !59, line: 16, size: 256, elements: !61)
!61 = !{!62, !67, !69, !78}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !60, file: !59, line: 17, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 192, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 6)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !60, file: !59, line: 18, baseType: !68, size: 64, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !60, file: !59, line: 19, baseType: !70, size: 64, offset: 128)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !72, line: 10, size: 128, elements: !73)
!72 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/nir_ophir/xdp-tutorial/af_xdp_our", checksumkind: CSK_MD5, checksum: "96c2435685fa7da2d24f219444d8659d")
!73 = !{!74, !77}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !71, file: !72, line: 11, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !76)
!76 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !71, file: !72, line: 12, baseType: !75, size: 64, offset: 64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !60, file: !59, line: 20, baseType: !79, size: 64, offset: 192)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !40)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "xsks_map", scope: !20, file: !3, line: 22, type: !83, isLocal: false, isDefinition: true)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 17, size: 256, elements: !84)
!84 = !{!85, !90, !91, !92}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !83, file: !3, line: 18, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 544, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 17)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !83, file: !3, line: 19, baseType: !68, size: 64, offset: 64)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !83, file: !3, line: 20, baseType: !68, size: 64, offset: 128)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !83, file: !3, line: 21, baseType: !93, size: 64, offset: 192)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 2048, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 64)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(name: "xdp_filter_map", scope: !20, file: !3, line: 29, type: !99, isLocal: false, isDefinition: true)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 24, size: 256, elements: !100)
!100 = !{!101, !106, !118, !119}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !99, file: !3, line: 25, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !104)
!104 = !{!105}
!105 = !DISubrange(count: 1)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !99, file: !3, line: 26, baseType: !107, size: 64, offset: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Key", file: !3, line: 31, size: 192, elements: !109)
!109 = !{!110, !111, !117}
!110 = !DIDerivedType(tag: DW_TAG_member, name: "ip_addr", scope: !108, file: !3, line: 32, baseType: !12, size: 32)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_addr", scope: !108, file: !3, line: 33, baseType: !112, size: 128, offset: 32)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !113, size: 128, elements: !115)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !114)
!114 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!115 = !{!116}
!116 = !DISubrange(count: 16)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "port_num", scope: !108, file: !3, line: 34, baseType: !32, size: 16, offset: 160)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !99, file: !3, line: 27, baseType: !68, size: 64, offset: 128)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !99, file: !3, line: 28, baseType: !93, size: 64, offset: 192)
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression())
!121 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !122, line: 177, type: !123, isLocal: true, isDefinition: true)
!122 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/xdp-tutorial/af_xdp_our", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DISubroutineType(types: !125)
!125 = !{!31, !126, !12, null}
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !20, file: !122, line: 56, type: !129, isLocal: true, isDefinition: true)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DISubroutineType(types: !131)
!131 = !{!30, !30, !132}
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!134 = !DIGlobalVariableExpression(var: !135, expr: !DIExpression())
!135 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !20, file: !122, line: 1323, type: !136, isLocal: true, isDefinition: true)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = !DISubroutineType(types: !138)
!138 = !{!31, !30, !75, !75}
!139 = !{!140, !141, !142, !147, !158, !187, !227, !228, !229, !234, !236}
!140 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 38, type: !7)
!141 = !DILocalVariable(name: "key", scope: !2, file: !3, line: 40, type: !108)
!142 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 41, type: !143)
!143 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !144, line: 33, size: 64, elements: !145)
!144 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/nir_ophir/xdp-tutorial/af_xdp_our", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!145 = !{!146}
!146 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !143, file: !144, line: 34, baseType: !30, size: 64)
!147 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 42, type: !148)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64)
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !150, line: 168, size: 112, elements: !151)
!150 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!151 = !{!152, !154, !155}
!152 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !149, file: !150, line: 169, baseType: !153, size: 48)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !114, size: 48, elements: !65)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !149, file: !150, line: 170, baseType: !153, size: 48, offset: 48)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !149, file: !150, line: 171, baseType: !156, size: 16, offset: 96)
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !157, line: 25, baseType: !32)
!157 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!158 = !DILocalVariable(name: "iphdr", scope: !2, file: !3, line: 43, type: !159)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !161, line: 87, size: 160, elements: !162)
!161 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!162 = !{!163, !164, !165, !166, !167, !168, !169, !170, !171, !173}
!163 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !160, file: !161, line: 89, baseType: !113, size: 4, flags: DIFlagBitField, extraData: i64 0)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !160, file: !161, line: 90, baseType: !113, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !160, file: !161, line: 97, baseType: !113, size: 8, offset: 8)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !160, file: !161, line: 98, baseType: !156, size: 16, offset: 16)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !160, file: !161, line: 99, baseType: !156, size: 16, offset: 32)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !160, file: !161, line: 100, baseType: !156, size: 16, offset: 48)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !160, file: !161, line: 101, baseType: !113, size: 8, offset: 64)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !160, file: !161, line: 102, baseType: !113, size: 8, offset: 72)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !160, file: !161, line: 103, baseType: !172, size: 16, offset: 80)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !157, line: 31, baseType: !32)
!173 = !DIDerivedType(tag: DW_TAG_member, scope: !160, file: !161, line: 104, baseType: !174, size: 64, offset: 96)
!174 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !160, file: !161, line: 104, size: 64, elements: !175)
!175 = !{!176, !182}
!176 = !DIDerivedType(tag: DW_TAG_member, scope: !174, file: !161, line: 104, baseType: !177, size: 64)
!177 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !174, file: !161, line: 104, size: 64, elements: !178)
!178 = !{!179, !181}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !177, file: !161, line: 104, baseType: !180, size: 32)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !157, line: 27, baseType: !12)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !177, file: !161, line: 104, baseType: !180, size: 32, offset: 32)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !174, file: !161, line: 104, baseType: !183, size: 64)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !174, file: !161, line: 104, size: 64, elements: !184)
!184 = !{!185, !186}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !183, file: !161, line: 104, baseType: !180, size: 32)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !183, file: !161, line: 104, baseType: !180, size: 32, offset: 32)
!187 = !DILocalVariable(name: "ipv6hdr", scope: !2, file: !3, line: 44, type: !188)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !190, line: 118, size: 320, elements: !191)
!190 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!191 = !{!192, !193, !194, !198, !199, !200, !201}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !189, file: !190, line: 120, baseType: !113, size: 4, flags: DIFlagBitField, extraData: i64 0)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !189, file: !190, line: 121, baseType: !113, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !189, file: !190, line: 128, baseType: !195, size: 24, offset: 8)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !113, size: 24, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 3)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !189, file: !190, line: 130, baseType: !156, size: 16, offset: 32)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !189, file: !190, line: 131, baseType: !113, size: 8, offset: 48)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !189, file: !190, line: 132, baseType: !113, size: 8, offset: 56)
!201 = !DIDerivedType(tag: DW_TAG_member, scope: !189, file: !190, line: 134, baseType: !202, size: 256, offset: 64)
!202 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !189, file: !190, line: 134, size: 256, elements: !203)
!203 = !{!204, !222}
!204 = !DIDerivedType(tag: DW_TAG_member, scope: !202, file: !190, line: 134, baseType: !205, size: 256)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !202, file: !190, line: 134, size: 256, elements: !206)
!206 = !{!207, !221}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !205, file: !190, line: 134, baseType: !208, size: 128)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !209, line: 33, size: 128, elements: !210)
!209 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!210 = !{!211}
!211 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !208, file: !209, line: 40, baseType: !212, size: 128)
!212 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !208, file: !209, line: 34, size: 128, elements: !213)
!213 = !{!214, !215, !219}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !212, file: !209, line: 35, baseType: !112, size: 128)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !212, file: !209, line: 37, baseType: !216, size: 128)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !156, size: 128, elements: !217)
!217 = !{!218}
!218 = !DISubrange(count: 8)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !212, file: !209, line: 38, baseType: !220, size: 128)
!220 = !DICompositeType(tag: DW_TAG_array_type, baseType: !180, size: 128, elements: !55)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !205, file: !190, line: 134, baseType: !208, size: 128, offset: 128)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !202, file: !190, line: 134, baseType: !223, size: 256)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !202, file: !190, line: 134, size: 256, elements: !224)
!224 = !{!225, !226}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !223, file: !190, line: 134, baseType: !208, size: 128)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !223, file: !190, line: 134, baseType: !208, size: 128, offset: 128)
!227 = !DILocalVariable(name: "eth_type", scope: !2, file: !3, line: 45, type: !6)
!228 = !DILocalVariable(name: "ip_type", scope: !2, file: !3, line: 45, type: !6)
!229 = !DILocalVariable(name: "i", scope: !230, file: !3, line: 74, type: !6)
!230 = distinct !DILexicalBlock(scope: !231, file: !3, line: 74, column: 9)
!231 = distinct !DILexicalBlock(scope: !232, file: !3, line: 68, column: 51)
!232 = distinct !DILexicalBlock(scope: !233, file: !3, line: 68, column: 16)
!233 = distinct !DILexicalBlock(scope: !2, file: !3, line: 62, column: 9)
!234 = !DILocalVariable(name: "i", scope: !235, file: !3, line: 84, type: !6)
!235 = distinct !DILexicalBlock(scope: !2, file: !3, line: 84, column: 2)
!236 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 95, type: !68)
!237 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 224, elements: !238)
!238 = !{!239}
!239 = !DISubrange(count: 28)
!240 = !{i32 7, !"Dwarf Version", i32 5}
!241 = !{i32 2, !"Debug Info Version", i32 3}
!242 = !{i32 1, !"wchar_size", i32 4}
!243 = !{i32 7, !"frame-pointer", i32 2}
!244 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!245 = !DILocation(line: 0, scope: !2)
!246 = !DILocation(line: 40, column: 5, scope: !2)
!247 = !DILocation(line: 40, column: 16, scope: !2)
!248 = !DILocation(line: 47, column: 33, scope: !2)
!249 = !{!250, !251, i64 0}
!250 = !{!"xdp_md", !251, i64 0, !251, i64 4, !251, i64 8, !251, i64 12, !251, i64 16, !251, i64 20}
!251 = !{!"int", !252, i64 0}
!252 = !{!"omnipotent char", !253, i64 0}
!253 = !{!"Simple C/C++ TBAA"}
!254 = !DILocation(line: 47, column: 22, scope: !2)
!255 = !DILocation(line: 47, column: 14, scope: !2)
!256 = !DILocation(line: 48, column: 2, scope: !2)
!257 = !DILocation(line: 58, column: 53, scope: !2)
!258 = !{!250, !251, i64 4}
!259 = !DILocation(line: 58, column: 42, scope: !2)
!260 = !DILocation(line: 58, column: 34, scope: !2)
!261 = !DILocalVariable(name: "nh", arg: 1, scope: !262, file: !144, line: 124, type: !265)
!262 = distinct !DISubprogram(name: "parse_ethhdr", scope: !144, file: !144, line: 124, type: !263, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !267)
!263 = !DISubroutineType(types: !264)
!264 = !{!6, !265, !30, !266}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!267 = !{!261, !268, !269}
!268 = !DILocalVariable(name: "data_end", arg: 2, scope: !262, file: !144, line: 125, type: !30)
!269 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !262, file: !144, line: 126, type: !266)
!270 = !DILocation(line: 0, scope: !262, inlinedAt: !271)
!271 = distinct !DILocation(line: 58, column: 16, scope: !2)
!272 = !DILocalVariable(name: "nh", arg: 1, scope: !273, file: !144, line: 79, type: !265)
!273 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !144, file: !144, line: 79, type: !274, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !281)
!274 = !DISubroutineType(types: !275)
!275 = !{!6, !265, !30, !266, !276}
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!277 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !144, line: 64, size: 32, elements: !278)
!278 = !{!279}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !277, file: !144, line: 65, baseType: !280, size: 32)
!280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 32, elements: !45)
!281 = !{!272, !282, !283, !284, !285, !286, !287, !293, !294}
!282 = !DILocalVariable(name: "data_end", arg: 2, scope: !273, file: !144, line: 80, type: !30)
!283 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !273, file: !144, line: 81, type: !266)
!284 = !DILocalVariable(name: "vlans", arg: 4, scope: !273, file: !144, line: 82, type: !276)
!285 = !DILocalVariable(name: "eth", scope: !273, file: !144, line: 84, type: !148)
!286 = !DILocalVariable(name: "hdrsize", scope: !273, file: !144, line: 85, type: !6)
!287 = !DILocalVariable(name: "vlh", scope: !273, file: !144, line: 86, type: !288)
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!289 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !144, line: 42, size: 32, elements: !290)
!290 = !{!291, !292}
!291 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !289, file: !144, line: 43, baseType: !156, size: 16)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !289, file: !144, line: 44, baseType: !156, size: 16, offset: 16)
!293 = !DILocalVariable(name: "h_proto", scope: !273, file: !144, line: 87, type: !32)
!294 = !DILocalVariable(name: "i", scope: !273, file: !144, line: 88, type: !6)
!295 = !DILocation(line: 0, scope: !273, inlinedAt: !296)
!296 = distinct !DILocation(line: 129, column: 9, scope: !262, inlinedAt: !271)
!297 = !DILocation(line: 93, column: 14, scope: !298, inlinedAt: !296)
!298 = distinct !DILexicalBlock(scope: !273, file: !144, line: 93, column: 6)
!299 = !DILocation(line: 93, column: 24, scope: !298, inlinedAt: !296)
!300 = !DILocation(line: 93, column: 6, scope: !273, inlinedAt: !296)
!301 = !DILocation(line: 99, column: 17, scope: !273, inlinedAt: !296)
!302 = !{!303, !303, i64 0}
!303 = !{!"short", !252, i64 0}
!304 = !DILocalVariable(name: "h_proto", arg: 1, scope: !305, file: !144, line: 68, type: !32)
!305 = distinct !DISubprogram(name: "proto_is_vlan", scope: !144, file: !144, line: 68, type: !306, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !308)
!306 = !DISubroutineType(types: !307)
!307 = !{!6, !32}
!308 = !{!304}
!309 = !DILocation(line: 0, scope: !305, inlinedAt: !310)
!310 = distinct !DILocation(line: 106, column: 8, scope: !311, inlinedAt: !296)
!311 = distinct !DILexicalBlock(scope: !312, file: !144, line: 106, column: 7)
!312 = distinct !DILexicalBlock(scope: !313, file: !144, line: 105, column: 39)
!313 = distinct !DILexicalBlock(scope: !314, file: !144, line: 105, column: 2)
!314 = distinct !DILexicalBlock(scope: !273, file: !144, line: 105, column: 2)
!315 = !DILocation(line: 70, column: 20, scope: !305, inlinedAt: !310)
!316 = !DILocation(line: 70, column: 46, scope: !305, inlinedAt: !310)
!317 = !DILocation(line: 106, column: 8, scope: !311, inlinedAt: !296)
!318 = !DILocation(line: 106, column: 7, scope: !312, inlinedAt: !296)
!319 = !DILocation(line: 112, column: 18, scope: !312, inlinedAt: !296)
!320 = !DILocation(line: 59, column: 9, scope: !2)
!321 = !DILocalVariable(name: "nh", arg: 1, scope: !322, file: !144, line: 151, type: !265)
!322 = distinct !DISubprogram(name: "parse_iphdr", scope: !144, file: !144, line: 151, type: !323, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !326)
!323 = !DISubroutineType(types: !324)
!324 = !{!6, !265, !30, !325}
!325 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!326 = !{!321, !327, !328, !329, !330}
!327 = !DILocalVariable(name: "data_end", arg: 2, scope: !322, file: !144, line: 152, type: !30)
!328 = !DILocalVariable(name: "iphdr", arg: 3, scope: !322, file: !144, line: 153, type: !325)
!329 = !DILocalVariable(name: "iph", scope: !322, file: !144, line: 155, type: !159)
!330 = !DILocalVariable(name: "hdrsize", scope: !322, file: !144, line: 156, type: !6)
!331 = !DILocation(line: 0, scope: !322, inlinedAt: !332)
!332 = distinct !DILocation(line: 63, column: 19, scope: !333)
!333 = distinct !DILexicalBlock(scope: !233, file: !3, line: 62, column: 42)
!334 = !DILocation(line: 158, column: 10, scope: !335, inlinedAt: !332)
!335 = distinct !DILexicalBlock(scope: !322, file: !144, line: 158, column: 6)
!336 = !DILocation(line: 158, column: 14, scope: !335, inlinedAt: !332)
!337 = !DILocation(line: 158, column: 6, scope: !322, inlinedAt: !332)
!338 = !DILocation(line: 161, column: 17, scope: !322, inlinedAt: !332)
!339 = !DILocation(line: 161, column: 21, scope: !322, inlinedAt: !332)
!340 = !DILocation(line: 163, column: 13, scope: !341, inlinedAt: !332)
!341 = distinct !DILexicalBlock(scope: !322, file: !144, line: 163, column: 5)
!342 = !DILocation(line: 163, column: 5, scope: !322, inlinedAt: !332)
!343 = !DILocation(line: 167, column: 14, scope: !344, inlinedAt: !332)
!344 = distinct !DILexicalBlock(scope: !322, file: !144, line: 167, column: 6)
!345 = !DILocation(line: 167, column: 24, scope: !344, inlinedAt: !332)
!346 = !DILocation(line: 167, column: 6, scope: !322, inlinedAt: !332)
!347 = !DILocation(line: 67, column: 30, scope: !333)
!348 = !{!252, !252, i64 0}
!349 = !DILocation(line: 67, column: 13, scope: !333)
!350 = !DILocation(line: 67, column: 21, scope: !333)
!351 = !{!352, !251, i64 0}
!352 = !{!"Key", !251, i64 0, !252, i64 4, !303, i64 20}
!353 = !DILocation(line: 68, column: 5, scope: !333)
!354 = !DILocalVariable(name: "nh", arg: 1, scope: !355, file: !144, line: 132, type: !265)
!355 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !144, file: !144, line: 132, type: !356, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !359)
!356 = !DISubroutineType(types: !357)
!357 = !{!6, !265, !30, !358}
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!359 = !{!354, !360, !361, !362}
!360 = !DILocalVariable(name: "data_end", arg: 2, scope: !355, file: !144, line: 133, type: !30)
!361 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !355, file: !144, line: 134, type: !358)
!362 = !DILocalVariable(name: "ip6h", scope: !355, file: !144, line: 136, type: !188)
!363 = !DILocation(line: 0, scope: !355, inlinedAt: !364)
!364 = distinct !DILocation(line: 69, column: 19, scope: !231)
!365 = !DILocation(line: 142, column: 11, scope: !366, inlinedAt: !364)
!366 = distinct !DILexicalBlock(scope: !355, file: !144, line: 142, column: 6)
!367 = !DILocation(line: 142, column: 17, scope: !366, inlinedAt: !364)
!368 = !DILocation(line: 142, column: 15, scope: !366, inlinedAt: !364)
!369 = !DILocation(line: 142, column: 6, scope: !355, inlinedAt: !364)
!370 = !DILocation(line: 0, scope: !230)
!371 = !DILocation(line: 75, column: 32, scope: !372)
!372 = distinct !DILexicalBlock(scope: !373, file: !3, line: 74, column: 38)
!373 = distinct !DILexicalBlock(scope: !230, file: !3, line: 74, column: 9)
!374 = !DILocation(line: 75, column: 13, scope: !372)
!375 = !DILocation(line: 75, column: 30, scope: !372)
!376 = !DILocation(line: 82, column: 2, scope: !377)
!377 = distinct !DILexicalBlock(scope: !2, file: !3, line: 82, column: 2)
!378 = !DILocation(line: 0, scope: !235)
!379 = !DILocation(line: 85, column: 3, scope: !380)
!380 = distinct !DILexicalBlock(scope: !381, file: !3, line: 85, column: 3)
!381 = distinct !DILexicalBlock(scope: !382, file: !3, line: 84, column: 31)
!382 = distinct !DILexicalBlock(scope: !235, file: !3, line: 84, column: 2)
!383 = !DILocation(line: 86, column: 7, scope: !381)
!384 = !DILocation(line: 91, column: 2, scope: !385)
!385 = distinct !DILexicalBlock(scope: !2, file: !3, line: 91, column: 2)
!386 = !DILocation(line: 95, column: 21, scope: !2)
!387 = !DILocation(line: 96, column: 10, scope: !388)
!388 = distinct !DILexicalBlock(scope: !2, file: !3, line: 96, column: 9)
!389 = !DILocation(line: 96, column: 9, scope: !2)
!390 = !DILocation(line: 87, column: 4, scope: !391)
!391 = distinct !DILexicalBlock(scope: !392, file: !3, line: 87, column: 4)
!392 = distinct !DILexicalBlock(scope: !393, file: !3, line: 86, column: 15)
!393 = distinct !DILexicalBlock(scope: !381, file: !3, line: 86, column: 7)
!394 = !DILocation(line: 84, column: 27, scope: !382)
!395 = !DILocation(line: 86, column: 9, scope: !393)
!396 = !DILocation(line: 99, column: 9, scope: !397)
!397 = distinct !DILexicalBlock(scope: !2, file: !3, line: 99, column: 9)
!398 = !{!251, !251, i64 0}
!399 = !DILocation(line: 99, column: 17, scope: !397)
!400 = !DILocation(line: 99, column: 9, scope: !2)
!401 = !DILocation(line: 100, column: 49, scope: !397)
!402 = !{!250, !251, i64 16}
!403 = !DILocation(line: 100, column: 44, scope: !397)
!404 = !DILocation(line: 100, column: 16, scope: !397)
!405 = !DILocation(line: 100, column: 9, scope: !397)
!406 = !DILocation(line: 103, column: 1, scope: !2)
