	.section __DWARF,__debug_frame,regular,debug
Lsection__debug_frame:
	.section __DWARF,__debug_info,regular,debug
Lsection__debug_info:
	.section __DWARF,__debug_abbrev,regular,debug
Lsection__debug_abbrev:
	.section __DWARF,__debug_aranges,regular,debug
Lsection__debug_aranges:
	.section __DWARF,__debug_macinfo,regular,debug
Lsection__debug_macinfo:
	.section __DWARF,__debug_line,regular,debug
Lsection__debug_line:
	.section __DWARF,__debug_loc,regular,debug
Lsection__debug_loc:
	.section __DWARF,__debug_pubnames,regular,debug
Lsection__debug_pubnames:
	.section __DWARF,__debug_pubtypes,regular,debug
Lsection__debug_pubtypes:
	.section __DWARF,__debug_inlined,regular,debug
Lsection__debug_inlined:
	.section __DWARF,__debug_str,regular,debug
Lsection__debug_str:
	.section __DWARF,__debug_ranges,regular,debug
Lsection__debug_ranges:
	.section __DWARF,__debug_abbrev,regular,debug
Ldebug_abbrev0:
	.section __DWARF,__debug_info,regular,debug
Ldebug_info0:
	.section __DWARF,__debug_line,regular,debug
Ldebug_line0:
	.text
Ltext0:
	.const
_ccWHITE:
	.byte	-1
	.byte	-1
	.byte	-1
_ccYELLOW:
	.byte	-1
	.byte	-1
	.byte	0
_ccBLUE:
	.byte	0
	.byte	0
	.byte	-1
_ccGREEN:
	.byte	0
	.byte	-1
	.byte	0
_ccRED:
	.byte	-1
	.byte	0
	.byte	0
_ccMAGENTA:
	.byte	-1
	.byte	0
	.byte	-1
_ccBLACK:
	.space 3
_ccORANGE:
	.byte	-1
	.byte	127
	.byte	0
_ccGRAY:
	.byte	-90
	.byte	-90
	.byte	-90
	.literal4
	.align 2
_kCDNoBuffer:
	.long	-1
	.text
"-[HitGenerator initWithTracks:rows:]":
LFB211:
	.file 1 "/Users/fpadilla/Documents/iphone/iNigma/HitGenerator.m"
	.loc 1 22 0
	pushl	%ebp
LCFI0:
	movl	%esp, %ebp
LCFI1:
	pushl	%ebx
LCFI2:
	subl	$36, %esp
LCFI3:
	call	L3
"L00000000001$pb":
L3:
	popl	%ebx
	.loc 1 23 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	leal	L_OBJC_CLASSLIST_SUP_REFS_$_2-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	leal	-16(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_7-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSendSuper2
	movl	%eax, 8(%ebp)
	.loc 1 24 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 25 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.rows$non_lazy_ptr-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 27 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.maxTries$non_lazy_ptr-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$3, (%eax)
	.loc 1 28 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.minHits$non_lazy_ptr-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$1, (%eax)
	.loc 1 29 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.trioStairRatio$non_lazy_ptr-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$80, (%eax)
	.loc 1 30 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveInterval$non_lazy_ptr-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$15, (%eax)
	.loc 1 31 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerInterval$non_lazy_ptr-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$15, (%eax)
	.loc 1 33 0
	movl	8(%ebp), %eax
	.loc 1 34 0
	addl	$36, %esp
	popl	%ebx
	leave
	ret
LFE211:
"-[HitGenerator generateHits:]":
LFB212:
	.loc 1 37 0
	pushl	%ebp
LCFI4:
	movl	%esp, %ebp
LCFI5:
	pushl	%ebx
LCFI6:
	subl	$36, %esp
LCFI7:
	call	L9
"L00000000002$pb":
L9:
	popl	%ebx
	.loc 1 38 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000002$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 39 0
	jmp	L5
L6:
	.loc 1 40 0
	movl	8(%ebp), %eax
	leal	L_OBJC_SELECTOR_REFERENCES_8-"L00000000002$pb"(%ebx), %edx
	movl	(%edx), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_objc_msgSend
L5:
	.loc 1 39 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000002$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	addl	-12(%ebp), %eax
	cmpl	%eax, %edx
	jle	L6
	.loc 1 42 0
	addl	$36, %esp
	popl	%ebx
	leave
	ret
LFE212:
	.cstring
LC0:
	.ascii " ******** Live Index: %i\0"
	.section __DATA, __cfstring
	.align 2
LC1:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC0
	.long	24
	.cstring
LC3:
	.ascii " ******** Joker Index: %i\0"
	.section __DATA, __cfstring
	.align 2
LC4:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC3
	.long	25
	.cstring
LC5:
	.ascii "RRR\0"
	.section __DATA, __cfstring
	.align 2
LC6:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC5
	.long	3
	.cstring
LC7:
	.ascii "JJJ\0"
	.section __DATA, __cfstring
	.align 2
LC8:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC7
	.long	3
	.cstring
LC9:
	.ascii "ATCG\0"
	.section __DATA, __cfstring
	.align 2
LC10:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC9
	.long	4
	.cstring
LC11:
	.ascii "%C%C%C\0"
	.section __DATA, __cfstring
	.align 2
LC12:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC11
	.long	6
	.cstring
LC14:
	.ascii "  - nil en track symbols\0"
	.section __DATA, __cfstring
	.align 2
LC15:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC14
	.long	24
	.cstring
	.align 2
LC16:
	.ascii "+ generationIndex %i Hit of %@ allocated at track %i position %i\0"
	.section __DATA, __cfstring
	.align 2
LC17:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC16
	.long	64
	.text
"-[HitGenerator generateHits]":
LFB213:
	.loc 1 45 0
	pushl	%ebp
LCFI8:
	movl	%esp, %ebp
LCFI9:
	pushl	%edi
LCFI10:
	pushl	%esi
LCFI11:
	pushl	%ebx
LCFI12:
	subl	$188, %esp
LCFI13:
	call	L61
"L00000000003$pb":
L61:
	popl	%ebx
	.loc 1 46 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_9-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	$2, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, -28(%ebp)
	.loc 1 47 0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_19-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %esi
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.rows$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$2, %eax
	cmpl	%eax, %esi
	jle	L60
	.loc 1 53 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L13
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitCount$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L13
	.loc 1 55 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edi
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.timeUpIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, %esi
	call	_arc4random
	andl	$3, %eax
	movl	%esi, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	decl	%eax
	movl	%eax, (%edi)
	.loc 1 57 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.timeRewardIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	(%edx), %eax
	incl	%eax
	movl	%eax, (%edx)
	.loc 1 59 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$1, (%eax)
	.loc 1 60 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitCount$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	(%edx), %eax
	decl	%eax
	movl	%eax, (%edx)
	.loc 1 61 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leal	LC1-"L00000000003$pb"(%ebx), %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_NSLog
L13:
	.loc 1 63 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L16
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitCount$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L16
	.loc 1 64 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %esi
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cvtsi2ss	%eax, %xmm1
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerInterval$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cvtsi2ss	%eax, %xmm0
	movaps	%xmm1, %xmm2
	divss	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, (%esp)
	call	_ceil
	fstpl	-128(%ebp)
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerInterval$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-128(%ebp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -120(%ebp)
	call	_arc4random
	movl	%eax, %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerInterval$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -156(%ebp)
	movl	%ecx, %eax
	movl	$0, %edx
	divl	-156(%ebp)
	movl	%edx, %eax
	incl	%eax
	subl	$2147483648, %eax
	movd	%eax, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	leal	LC2-"L00000000003$pb"(%ebx), %eax
	movapd	%xmm0, -152(%ebp)
	movapd	-152(%ebp), %xmm0
	addsd	(%eax), %xmm0
	movapd	%xmm0, -152(%ebp)
	movsd	-152(%ebp), %xmm0
	addsd	-120(%ebp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, (%esi)
	.loc 1 65 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jge	L19
	.loc 1 66 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	incl	%eax
	movl	%eax, (%ecx)
L19:
	.loc 1 68 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$1, (%eax)
	.loc 1 69 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitCount$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	(%edx), %eax
	decl	%eax
	movl	%eax, (%edx)
	.loc 1 70 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leal	LC4-"L00000000003$pb"(%ebx), %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_NSLog
L16:
	.loc 1 73 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	L21
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	L21
	.loc 1 75 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jne	L24
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L24
	.loc 1 76 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$2, (%eax)
	.loc 1 77 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$3, (%eax)
	.loc 1 78 0
	movl	8(%ebp), %ecx
	leal	LC6-"L00000000003$pb"(%ebx), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_10-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	.loc 1 75 0
	jmp	L21
L24:
	.loc 1 79 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jne	L21
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L21
	.loc 1 80 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$2, (%eax)
	.loc 1 81 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$3, (%eax)
	.loc 1 82 0
	movl	8(%ebp), %ecx
	leal	LC8-"L00000000003$pb"(%ebx), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_10-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
L21:
	.loc 1 85 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	L29
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	L29
	.loc 1 86 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, -108(%ebp)
	call	_arc4random
	movl	%eax, -160(%ebp)
	movl	$1148159575, -156(%ebp)
	movl	-156(%ebp), %eax
	mull	-160(%ebp)
	movl	%edx, %ecx
	movl	-160(%ebp), %eax
	subl	%ecx, %eax
	shrl	%eax
	leal	(%ecx,%eax), %eax
	movl	%eax, %edi
	shrl	$6, %edi
	movl	%edi, -100(%ebp)
	imull	$101, -100(%ebp), %eax
	movl	-160(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, -100(%ebp)
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.trioStairRatio$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, -100(%ebp)
	jbe	L32
	movl	$4, -104(%ebp)
	jmp	L34
L32:
	movl	$3, -104(%ebp)
L34:
	movl	-104(%ebp), %eax
	movl	-108(%ebp), %edi
	movl	%eax, (%edi)
	.loc 1 87 0
	movl	8(%ebp), %ecx
	leal	LC10-"L00000000003$pb"(%ebx), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_10-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	.loc 1 88 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	L29
LBB2:
	.loc 1 89 0
	leal	L_OBJC_CLASSLIST_REFERENCES_$_3-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_11-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, -32(%ebp)
	.loc 1 90 0
	leal	L_OBJC_CLASSLIST_REFERENCES_$_1-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %esi
	movl	-32(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_20-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movzwl	%ax, %edi
	movl	-32(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_20-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movzwl	%ax, %eax
	movl	%eax, -96(%ebp)
	movl	-32(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_20-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movzwl	%ax, %edx
	leal	LC12-"L00000000003$pb"(%ebx), %ecx
	leal	L_OBJC_SELECTOR_REFERENCES_12-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edi, 20(%esp)
	movl	-96(%ebp), %edi
	movl	%edi, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_objc_msgSend
	movl	8(%ebp), %ecx
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_10-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
L29:
LBE2:
	.loc 1 95 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tries$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.maxTries$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jge	L36
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.hits$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.minHits$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jl	L38
L36:
	.loc 1 96 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	incl	%eax
	movl	%eax, (%ecx)
	.loc 1 97 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tries$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$0, (%eax)
	.loc 1 98 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.hits$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$0, (%eax)
L38:
	.loc 1 101 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.isHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movb	$1, (%eax)
	.loc 1 102 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tries$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tries$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	incl	%eax
	movl	%eax, (%ecx)
	.loc 1 104 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_13-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -36(%ebp)
	.loc 1 105 0
	call	_arc4random
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	incl	%eax
	movl	%eax, -156(%ebp)
	movl	%edx, %eax
	movl	$0, %edx
	divl	-156(%ebp)
	movl	%edx, %eax
	movl	%eax, -36(%ebp)
	.loc 1 106 0
	call	_arc4random
	movl	%eax, %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.rows$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	decl	%eax
	movl	%eax, -156(%ebp)
	movl	%ecx, %eax
	movl	$0, %edx
	divl	-156(%ebp)
	movl	%edx, %eax
	incl	%eax
	movl	%eax, -40(%ebp)
LBB3:
	.loc 1 110 0
	movl	$0, -44(%ebp)
	jmp	L39
L40:
LBB4:
	.loc 1 111 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	movl	-44(%ebp), %eax
	addl	-36(%ebp), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_9-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	movl	%eax, -48(%ebp)
	.loc 1 115 0
	movl	-48(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_21-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-92(%ebp)
	leal	LC13-"L00000000003$pb"(%ebx), %eax
	movss	(%eax), %xmm0
	movss	-92(%ebp), %xmm1
	ucomiss	%xmm0, %xmm1
	ja	L43
	jmp	L41
L43:
	.loc 1 116 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.rows$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	subl	-40(%ebp), %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, -52(%ebp)
	jmp	L44
L41:
	.loc 1 118 0
	movl	-40(%ebp), %ecx
	decl	%ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, -52(%ebp)
L44:
	.loc 1 122 0
	movl	-48(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_22-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %ecx
	movl	-52(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_9-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	movl	%eax, -56(%ebp)
	.loc 1 123 0
	cmpl	$0, -56(%ebp)
	jne	L45
	.loc 1 124 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.isHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movb	$0, (%eax)
	.loc 1 125 0
	leal	LC15-"L00000000003$pb"(%ebx), %eax
	movl	%eax, (%esp)
	call	_NSLog
	.loc 1 126 0
	jmp	L47
L45:
	.loc 1 129 0
	leal	L_OBJC_CLASSLIST_REFERENCES_$_3-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_14-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	cmpl	-56(%ebp), %eax
	je	L48
	.loc 1 130 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.isHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movb	$0, (%eax)
	.loc 1 132 0
	jmp	L47
L48:
	.loc 1 135 0
	movl	-44(%ebp), %edx
	movl	-52(%ebp), %eax
	movl	%eax, -80(%ebp,%edx,4)
LBE4:
	.loc 1 110 0
	incl	-44(%ebp)
L39:
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	-44(%ebp), %eax
	jg	L40
L47:
LBE3:
	.loc 1 138 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.isHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L60
	.loc 1 139 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.hits$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %ecx
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.hits$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	incl	%eax
	movl	%eax, (%ecx)
	.loc 1 140 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	L51
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L53
L51:
	.loc 1 141 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.hitString$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %edx
	leal	LC17-"L00000000003$pb"(%ebx), %ecx
	movl	-40(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%esi, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	_NSLog
L53:
	.loc 1 145 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L54
	.loc 1 146 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$0, (%eax)
L54:
	.loc 1 149 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L56
	.loc 1 150 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	$0, (%eax)
L56:
LBB5:
	.loc 1 153 0
	movl	$0, -60(%ebp)
	jmp	L58
L59:
LBB6:
	.loc 1 154 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	movl	-36(%ebp), %eax
	addl	-60(%ebp), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_9-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	movl	%eax, -64(%ebp)
	.loc 1 155 0
	movl	-64(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_22-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %esi
	leal	L_OBJC_CLASSLIST_REFERENCES_$_3-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_15-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %edi
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.hitString$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	movl	-60(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_16-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	movzwl	%ax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_17-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	call	_objc_msgSend
	movl	%eax, %ecx
	movl	-60(%ebp), %eax
	movl	-80(%ebp,%eax,4), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_18-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_objc_msgSend
LBE6:
	.loc 1 153 0
	incl	-60(%ebp)
L58:
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	cmpl	-60(%ebp), %eax
	jg	L59
L60:
LBE5:
	.loc 1 161 0
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
LFE213:
"-[HitGenerator initSymbolArrays:]":
LFB214:
	.loc 1 164 0
	pushl	%ebp
LCFI14:
	movl	%esp, %ebp
LCFI15:
	pushl	%edi
LCFI16:
	pushl	%esi
LCFI17:
	pushl	%ebx
LCFI18:
	subl	$172, %esp
LCFI19:
	call	L76
"L00000000004$pb":
L76:
	popl	%ebx
LBB7:
	.loc 1 166 0
	leal	-64(%ebp), %edi
	cld
	movl	$0, %edx
	movl	$8, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	rep
	stosl
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -152(%ebp)
	leal	L_OBJC_SELECTOR_REFERENCES_26-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %edx
	movl	$16, 16(%esp)
	leal	-128(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-64(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	-152(%ebp), %eax
	movl	%eax, (%esp)
	call	_objc_msgSend
	movl	%eax, -148(%ebp)
	cmpl	$0, -148(%ebp)
	je	L63
	movl	-56(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -144(%ebp)
L65:
	movl	$0, -140(%ebp)
L66:
	movl	-56(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-144(%ebp), %eax
	je	L67
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_objc_enumerationMutation
L67:
	movl	-60(%ebp), %edx
	movl	-140(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -28(%ebp)
	incl	-140(%ebp)
	.loc 1 167 0
	leal	L_OBJC_CLASSLIST_REFERENCES_$_4-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_15-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %ecx
	movl	16(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_23-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	movl	-28(%ebp), %ecx
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_24-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
LBB8:
	.loc 1 168 0
	movl	$0, -32(%ebp)
	jmp	L69
L70:
	.loc 1 169 0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_22-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %esi
	leal	L_OBJC_CLASSLIST_REFERENCES_$_3-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_14-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_25-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_objc_msgSend
	.loc 1 168 0
	incl	-32(%ebp)
L69:
	movl	-32(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L70
LBE8:
	.loc 1 166 0
	movl	-148(%ebp), %eax
	cmpl	%eax, -140(%ebp)
	jb	L66
	leal	L_OBJC_SELECTOR_REFERENCES_26-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %edx
	movl	$16, 16(%esp)
	leal	-128(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-64(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	-152(%ebp), %eax
	movl	%eax, (%esp)
	call	_objc_msgSend
	movl	%eax, -148(%ebp)
	cmpl	$0, -148(%ebp)
	jne	L65
	movl	$0, -28(%ebp)
	jmp	L75
L63:
	movl	$0, -28(%ebp)
L75:
LBE7:
	.loc 1 172 0
	addl	$172, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
LFE214:
"-[HitGenerator timeUpIndex]":
LFB215:
	.loc 1 19 0
	pushl	%ebp
LCFI20:
	movl	%esp, %ebp
LCFI21:
	subl	$8, %esp
LCFI22:
	call	L79
"L00000000005$pb":
L79:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.timeUpIndex$non_lazy_ptr-"L00000000005$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE215:
"-[HitGenerator setTimeUpIndex:]":
LFB216:
	.loc 1 19 0
	pushl	%ebp
LCFI23:
	movl	%esp, %ebp
LCFI24:
	subl	$8, %esp
LCFI25:
	call	L82
"L00000000006$pb":
L82:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.timeUpIndex$non_lazy_ptr-"L00000000006$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE216:
"-[HitGenerator timeRewards]":
LFB217:
	.loc 1 19 0
	pushl	%ebp
LCFI26:
	movl	%esp, %ebp
LCFI27:
	subl	$8, %esp
LCFI28:
	call	L85
"L00000000007$pb":
L85:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.timeRewards$non_lazy_ptr-"L00000000007$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE217:
"-[HitGenerator setTimeRewards:]":
LFB218:
	.loc 1 19 0
	pushl	%ebp
LCFI29:
	movl	%esp, %ebp
LCFI30:
	subl	$8, %esp
LCFI31:
	call	L88
"L00000000008$pb":
L88:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.timeRewards$non_lazy_ptr-"L00000000008$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE218:
"-[HitGenerator trioStairRatio]":
LFB219:
	.loc 1 19 0
	pushl	%ebp
LCFI32:
	movl	%esp, %ebp
LCFI33:
	subl	$8, %esp
LCFI34:
	call	L91
"L00000000009$pb":
L91:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.trioStairRatio$non_lazy_ptr-"L00000000009$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE219:
"-[HitGenerator setTrioStairRatio:]":
LFB220:
	.loc 1 19 0
	pushl	%ebp
LCFI35:
	movl	%esp, %ebp
LCFI36:
	subl	$8, %esp
LCFI37:
	call	L94
"L00000000010$pb":
L94:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.trioStairRatio$non_lazy_ptr-"L00000000010$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE220:
"-[HitGenerator maxTries]":
LFB221:
	.loc 1 19 0
	pushl	%ebp
LCFI38:
	movl	%esp, %ebp
LCFI39:
	subl	$8, %esp
LCFI40:
	call	L97
"L00000000011$pb":
L97:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.maxTries$non_lazy_ptr-"L00000000011$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE221:
"-[HitGenerator setMaxTries:]":
LFB222:
	.loc 1 19 0
	pushl	%ebp
LCFI41:
	movl	%esp, %ebp
LCFI42:
	subl	$8, %esp
LCFI43:
	call	L100
"L00000000012$pb":
L100:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.maxTries$non_lazy_ptr-"L00000000012$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE222:
"-[HitGenerator minHits]":
LFB223:
	.loc 1 19 0
	pushl	%ebp
LCFI44:
	movl	%esp, %ebp
LCFI45:
	subl	$8, %esp
LCFI46:
	call	L103
"L00000000013$pb":
L103:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.minHits$non_lazy_ptr-"L00000000013$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE223:
"-[HitGenerator setMinHits:]":
LFB224:
	.loc 1 19 0
	pushl	%ebp
LCFI47:
	movl	%esp, %ebp
LCFI48:
	subl	$8, %esp
LCFI49:
	call	L106
"L00000000014$pb":
L106:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.minHits$non_lazy_ptr-"L00000000014$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE224:
"-[HitGenerator liveInterval]":
LFB225:
	.loc 1 19 0
	pushl	%ebp
LCFI50:
	movl	%esp, %ebp
LCFI51:
	subl	$8, %esp
LCFI52:
	call	L109
"L00000000015$pb":
L109:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveInterval$non_lazy_ptr-"L00000000015$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE225:
"-[HitGenerator setLiveInterval:]":
LFB226:
	.loc 1 19 0
	pushl	%ebp
LCFI53:
	movl	%esp, %ebp
LCFI54:
	subl	$8, %esp
LCFI55:
	call	L112
"L00000000016$pb":
L112:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveInterval$non_lazy_ptr-"L00000000016$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE226:
"-[HitGenerator liveHitCount]":
LFB227:
	.loc 1 19 0
	pushl	%ebp
LCFI56:
	movl	%esp, %ebp
LCFI57:
	subl	$8, %esp
LCFI58:
	call	L115
"L00000000017$pb":
L115:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitCount$non_lazy_ptr-"L00000000017$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE227:
"-[HitGenerator setLiveHitCount:]":
LFB228:
	.loc 1 19 0
	pushl	%ebp
LCFI59:
	movl	%esp, %ebp
LCFI60:
	subl	$8, %esp
LCFI61:
	call	L118
"L00000000018$pb":
L118:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.liveHitCount$non_lazy_ptr-"L00000000018$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE228:
"-[HitGenerator jokerInterval]":
LFB229:
	.loc 1 19 0
	pushl	%ebp
LCFI62:
	movl	%esp, %ebp
LCFI63:
	subl	$8, %esp
LCFI64:
	call	L121
"L00000000019$pb":
L121:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerInterval$non_lazy_ptr-"L00000000019$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE229:
"-[HitGenerator setJokerInterval:]":
LFB230:
	.loc 1 19 0
	pushl	%ebp
LCFI65:
	movl	%esp, %ebp
LCFI66:
	subl	$8, %esp
LCFI67:
	call	L124
"L00000000020$pb":
L124:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerInterval$non_lazy_ptr-"L00000000020$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE230:
"-[HitGenerator jokerHitCount]":
LFB231:
	.loc 1 19 0
	pushl	%ebp
LCFI68:
	movl	%esp, %ebp
LCFI69:
	subl	$8, %esp
LCFI70:
	call	L127
"L00000000021$pb":
L127:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitCount$non_lazy_ptr-"L00000000021$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	leave
	ret
LFE231:
"-[HitGenerator setJokerHitCount:]":
LFB232:
	.loc 1 19 0
	pushl	%ebp
LCFI71:
	movl	%esp, %ebp
LCFI72:
	subl	$8, %esp
LCFI73:
	call	L130
"L00000000022$pb":
L130:
	popl	%ecx
	.loc 1 19 0
	movl	8(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.jokerHitCount$non_lazy_ptr-"L00000000022$pb"(%ecx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	leave
	ret
LFE232:
"-[HitGenerator hitString]":
LFB233:
	.loc 1 19 0
	pushl	%ebp
LCFI74:
	movl	%esp, %ebp
LCFI75:
	pushl	%ebx
LCFI76:
	subl	$20, %esp
LCFI77:
	call	L133
"L00000000023$pb":
L133:
	popl	%ebx
	.loc 1 19 0
	leal	L_OBJC_IVAR_$_HitGenerator.hitString$non_lazy_ptr-"L00000000023$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	movl	8(%ebp), %edx
	movl	$1, 12(%esp)
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_getProperty
	addl	$20, %esp
	popl	%ebx
	leave
	ret
LFE233:
"-[HitGenerator setHitString:]":
LFB234:
	.loc 1 19 0
	pushl	%ebp
LCFI78:
	movl	%esp, %ebp
LCFI79:
	pushl	%ebx
LCFI80:
	subl	$36, %esp
LCFI81:
	call	L136
"L00000000024$pb":
L136:
	popl	%ebx
	.loc 1 19 0
	movl	16(%ebp), %edx
	leal	L_OBJC_IVAR_$_HitGenerator.hitString$non_lazy_ptr-"L00000000024$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	movl	8(%ebp), %ecx
	movl	$0, 20(%esp)
	movl	$1, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_setProperty
	addl	$36, %esp
	popl	%ebx
	leave
	ret
LFE234:
	.cstring
L_OBJC_METH_VAR_NAME_0:
	.ascii "jokerInterval\0"
L_OBJC_METH_VAR_TYPE_0:
	.ascii "i\0"
L_OBJC_METH_VAR_NAME_1:
	.ascii "jokerHitCount\0"
L_OBJC_METH_VAR_NAME_2:
	.ascii "timeUpIndex\0"
L_OBJC_METH_VAR_NAME_3:
	.ascii "liveInterval\0"
L_OBJC_METH_VAR_NAME_4:
	.ascii "liveHitCount\0"
L_OBJC_METH_VAR_NAME_5:
	.ascii "maxTries\0"
L_OBJC_METH_VAR_NAME_6:
	.ascii "minHits\0"
L_OBJC_METH_VAR_NAME_7:
	.ascii "rows\0"
L_OBJC_METH_VAR_NAME_8:
	.ascii "trioStairRatio\0"
L_OBJC_METH_VAR_NAME_9:
	.ascii "timeRewards\0"
L_OBJC_METH_VAR_TYPE_1:
	.ascii "@\"NSArray\"\0"
L_OBJC_METH_VAR_NAME_10:
	.ascii "generationIndex\0"
L_OBJC_METH_VAR_NAME_11:
	.ascii "hitString\0"
L_OBJC_METH_VAR_TYPE_2:
	.ascii "@\"NSString\"\0"
L_OBJC_METH_VAR_NAME_12:
	.ascii "isHit\0"
L_OBJC_METH_VAR_TYPE_3:
	.ascii "c\0"
L_OBJC_METH_VAR_NAME_13:
	.ascii "jokerHitStatus\0"
L_OBJC_METH_VAR_NAME_14:
	.ascii "liveHitStatus\0"
L_OBJC_METH_VAR_NAME_15:
	.ascii "typeHit\0"
L_OBJC_METH_VAR_NAME_16:
	.ascii "jokerIndex\0"
L_OBJC_METH_VAR_NAME_17:
	.ascii "liveIndex\0"
L_OBJC_METH_VAR_NAME_18:
	.ascii "timeRewardIndex\0"
L_OBJC_METH_VAR_NAME_19:
	.ascii "tracks\0"
L_OBJC_METH_VAR_NAME_20:
	.ascii "hits\0"
L_OBJC_METH_VAR_NAME_21:
	.ascii "tries\0"
	.section __DATA, __objc_const
	.align 2
l_OBJC_$_INSTANCE_VARIABLES_HitGenerator:
	.long	20
	.long	22
	.long	_OBJC_IVAR_$_HitGenerator.jokerInterval
	.long	L_OBJC_METH_VAR_NAME_0
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.jokerHitCount
	.long	L_OBJC_METH_VAR_NAME_1
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.timeUpIndex
	.long	L_OBJC_METH_VAR_NAME_2
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.liveInterval
	.long	L_OBJC_METH_VAR_NAME_3
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.liveHitCount
	.long	L_OBJC_METH_VAR_NAME_4
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.maxTries
	.long	L_OBJC_METH_VAR_NAME_5
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.minHits
	.long	L_OBJC_METH_VAR_NAME_6
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.rows
	.long	L_OBJC_METH_VAR_NAME_7
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.trioStairRatio
	.long	L_OBJC_METH_VAR_NAME_8
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.timeRewards
	.long	L_OBJC_METH_VAR_NAME_9
	.long	L_OBJC_METH_VAR_TYPE_1
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.generationIndex
	.long	L_OBJC_METH_VAR_NAME_10
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.hitString
	.long	L_OBJC_METH_VAR_NAME_11
	.long	L_OBJC_METH_VAR_TYPE_2
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.isHit
	.long	L_OBJC_METH_VAR_NAME_12
	.long	L_OBJC_METH_VAR_TYPE_3
	.long	0
	.long	1
	.long	_OBJC_IVAR_$_HitGenerator.jokerHitStatus
	.long	L_OBJC_METH_VAR_NAME_13
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.liveHitStatus
	.long	L_OBJC_METH_VAR_NAME_14
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.typeHit
	.long	L_OBJC_METH_VAR_NAME_15
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.jokerIndex
	.long	L_OBJC_METH_VAR_NAME_16
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.liveIndex
	.long	L_OBJC_METH_VAR_NAME_17
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.timeRewardIndex
	.long	L_OBJC_METH_VAR_NAME_18
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.tracks
	.long	L_OBJC_METH_VAR_NAME_19
	.long	L_OBJC_METH_VAR_TYPE_1
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.hits
	.long	L_OBJC_METH_VAR_NAME_20
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.long	_OBJC_IVAR_$_HitGenerator.tries
	.long	L_OBJC_METH_VAR_NAME_21
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	2
	.long	4
	.cstring
L_OBJC_METH_VAR_NAME_22:
	.ascii "setHitString:\0"
L_OBJC_METH_VAR_TYPE_4:
	.ascii "v12@0:4@8\0"
L_OBJC_METH_VAR_TYPE_5:
	.ascii "@8@0:4\0"
L_OBJC_METH_VAR_NAME_23:
	.ascii "setJokerHitCount:\0"
L_OBJC_METH_VAR_TYPE_6:
	.ascii "v12@0:4i8\0"
L_OBJC_METH_VAR_TYPE_7:
	.ascii "i8@0:4\0"
L_OBJC_METH_VAR_NAME_24:
	.ascii "setJokerInterval:\0"
L_OBJC_METH_VAR_NAME_25:
	.ascii "setLiveHitCount:\0"
L_OBJC_METH_VAR_NAME_26:
	.ascii "setLiveInterval:\0"
L_OBJC_METH_VAR_NAME_27:
	.ascii "setMinHits:\0"
L_OBJC_METH_VAR_NAME_28:
	.ascii "setMaxTries:\0"
L_OBJC_METH_VAR_NAME_29:
	.ascii "setTrioStairRatio:\0"
L_OBJC_METH_VAR_NAME_30:
	.ascii "setTimeRewards:\0"
L_OBJC_METH_VAR_NAME_31:
	.ascii "setTimeUpIndex:\0"
L_OBJC_METH_VAR_NAME_32:
	.ascii "initSymbolArrays:\0"
L_OBJC_METH_VAR_NAME_33:
	.ascii "generateHits\0"
L_OBJC_METH_VAR_TYPE_8:
	.ascii "v8@0:4\0"
L_OBJC_METH_VAR_NAME_34:
	.ascii "generateHits:\0"
L_OBJC_METH_VAR_NAME_35:
	.ascii "initWithTracks:rows:\0"
L_OBJC_METH_VAR_TYPE_9:
	.ascii "@16@0:4@8@12\0"
	.section __DATA, __objc_const
	.align 2
l_OBJC_$_INSTANCE_METHODS_HitGenerator:
	.long	12
	.long	24
	.long	L_OBJC_METH_VAR_NAME_22
	.long	L_OBJC_METH_VAR_TYPE_4
	.long	"-[HitGenerator setHitString:]"
	.long	L_OBJC_METH_VAR_NAME_11
	.long	L_OBJC_METH_VAR_TYPE_5
	.long	"-[HitGenerator hitString]"
	.long	L_OBJC_METH_VAR_NAME_23
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setJokerHitCount:]"
	.long	L_OBJC_METH_VAR_NAME_1
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator jokerHitCount]"
	.long	L_OBJC_METH_VAR_NAME_24
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setJokerInterval:]"
	.long	L_OBJC_METH_VAR_NAME_0
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator jokerInterval]"
	.long	L_OBJC_METH_VAR_NAME_25
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setLiveHitCount:]"
	.long	L_OBJC_METH_VAR_NAME_4
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator liveHitCount]"
	.long	L_OBJC_METH_VAR_NAME_26
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setLiveInterval:]"
	.long	L_OBJC_METH_VAR_NAME_3
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator liveInterval]"
	.long	L_OBJC_METH_VAR_NAME_27
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setMinHits:]"
	.long	L_OBJC_METH_VAR_NAME_6
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator minHits]"
	.long	L_OBJC_METH_VAR_NAME_28
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setMaxTries:]"
	.long	L_OBJC_METH_VAR_NAME_5
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator maxTries]"
	.long	L_OBJC_METH_VAR_NAME_29
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setTrioStairRatio:]"
	.long	L_OBJC_METH_VAR_NAME_8
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator trioStairRatio]"
	.long	L_OBJC_METH_VAR_NAME_30
	.long	L_OBJC_METH_VAR_TYPE_4
	.long	"-[HitGenerator setTimeRewards:]"
	.long	L_OBJC_METH_VAR_NAME_9
	.long	L_OBJC_METH_VAR_TYPE_5
	.long	"-[HitGenerator timeRewards]"
	.long	L_OBJC_METH_VAR_NAME_31
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator setTimeUpIndex:]"
	.long	L_OBJC_METH_VAR_NAME_2
	.long	L_OBJC_METH_VAR_TYPE_7
	.long	"-[HitGenerator timeUpIndex]"
	.long	L_OBJC_METH_VAR_NAME_32
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator initSymbolArrays:]"
	.long	L_OBJC_METH_VAR_NAME_33
	.long	L_OBJC_METH_VAR_TYPE_8
	.long	"-[HitGenerator generateHits]"
	.long	L_OBJC_METH_VAR_NAME_34
	.long	L_OBJC_METH_VAR_TYPE_6
	.long	"-[HitGenerator generateHits:]"
	.long	L_OBJC_METH_VAR_NAME_35
	.long	L_OBJC_METH_VAR_TYPE_9
	.long	"-[HitGenerator initWithTracks:rows:]"
	.cstring
L_OBJC_PROP_NAME_ATTR_0:
	.ascii "timeUpIndex\0"
L_OBJC_PROP_NAME_ATTR_1:
	.ascii "Ti,VtimeUpIndex\0"
L_OBJC_PROP_NAME_ATTR_2:
	.ascii "timeRewards\0"
L_OBJC_PROP_NAME_ATTR_3:
	.ascii "T@\"NSArray\",VtimeRewards\0"
L_OBJC_PROP_NAME_ATTR_4:
	.ascii "trioStairRatio\0"
L_OBJC_PROP_NAME_ATTR_5:
	.ascii "Ti,VtrioStairRatio\0"
L_OBJC_PROP_NAME_ATTR_6:
	.ascii "maxTries\0"
L_OBJC_PROP_NAME_ATTR_7:
	.ascii "Ti,VmaxTries\0"
L_OBJC_PROP_NAME_ATTR_8:
	.ascii "minHits\0"
L_OBJC_PROP_NAME_ATTR_9:
	.ascii "Ti,VminHits\0"
L_OBJC_PROP_NAME_ATTR_10:
	.ascii "liveInterval\0"
L_OBJC_PROP_NAME_ATTR_11:
	.ascii "Ti,VliveInterval\0"
L_OBJC_PROP_NAME_ATTR_12:
	.ascii "liveHitCount\0"
L_OBJC_PROP_NAME_ATTR_13:
	.ascii "Ti,VliveHitCount\0"
L_OBJC_PROP_NAME_ATTR_14:
	.ascii "jokerInterval\0"
L_OBJC_PROP_NAME_ATTR_15:
	.ascii "Ti,VjokerInterval\0"
L_OBJC_PROP_NAME_ATTR_16:
	.ascii "jokerHitCount\0"
L_OBJC_PROP_NAME_ATTR_17:
	.ascii "Ti,VjokerHitCount\0"
L_OBJC_PROP_NAME_ATTR_18:
	.ascii "hitString\0"
L_OBJC_PROP_NAME_ATTR_19:
	.ascii "T@\"NSString\",&,VhitString\0"
	.section __DATA, __objc_const
	.align 2
l_OBJC_$_PROP_LIST_HitGenerator:
	.long	8
	.long	10
	.long	L_OBJC_PROP_NAME_ATTR_0
	.long	L_OBJC_PROP_NAME_ATTR_1
	.long	L_OBJC_PROP_NAME_ATTR_2
	.long	L_OBJC_PROP_NAME_ATTR_3
	.long	L_OBJC_PROP_NAME_ATTR_4
	.long	L_OBJC_PROP_NAME_ATTR_5
	.long	L_OBJC_PROP_NAME_ATTR_6
	.long	L_OBJC_PROP_NAME_ATTR_7
	.long	L_OBJC_PROP_NAME_ATTR_8
	.long	L_OBJC_PROP_NAME_ATTR_9
	.long	L_OBJC_PROP_NAME_ATTR_10
	.long	L_OBJC_PROP_NAME_ATTR_11
	.long	L_OBJC_PROP_NAME_ATTR_12
	.long	L_OBJC_PROP_NAME_ATTR_13
	.long	L_OBJC_PROP_NAME_ATTR_14
	.long	L_OBJC_PROP_NAME_ATTR_15
	.long	L_OBJC_PROP_NAME_ATTR_16
	.long	L_OBJC_PROP_NAME_ATTR_17
	.long	L_OBJC_PROP_NAME_ATTR_18
	.long	L_OBJC_PROP_NAME_ATTR_19
	.cstring
L_OBJC_CLASS_NAME_0:
	.ascii "HitGenerator\0"
	.section __DATA, __objc_const
	.align 2
l_OBJC_METACLASS_RO_$_HitGenerator:
	.long	1
	.long	20
	.long	20
	.long	0
	.long	L_OBJC_CLASS_NAME_0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.private_extern _OBJC_METACLASS_$_HitGenerator
.globl _OBJC_METACLASS_$_HitGenerator
	.section __DATA, __objc_data
	.align 2
_OBJC_METACLASS_$_HitGenerator:
	.long	_OBJC_METACLASS_$_NSObject
	.long	_OBJC_METACLASS_$_NSObject
	.long	__objc_empty_cache
	.long	__objc_empty_vtable
	.long	l_OBJC_METACLASS_RO_$_HitGenerator
	.section __DATA, __objc_const
	.align 2
l_OBJC_CLASS_RO_$_HitGenerator:
	.long	0
	.long	4
	.long	92
	.long	0
	.long	L_OBJC_CLASS_NAME_0
	.long	l_OBJC_$_INSTANCE_METHODS_HitGenerator
	.long	0
	.long	l_OBJC_$_INSTANCE_VARIABLES_HitGenerator
	.long	0
	.long	l_OBJC_$_PROP_LIST_HitGenerator
	.private_extern _OBJC_CLASS_$_HitGenerator
.globl _OBJC_CLASS_$_HitGenerator
	.section __DATA, __objc_data
	.align 2
_OBJC_CLASS_$_HitGenerator:
	.long	_OBJC_METACLASS_$_HitGenerator
	.long	_OBJC_CLASS_$_NSObject
	.long	__objc_empty_cache
	.long	__objc_empty_vtable
	.long	l_OBJC_CLASS_RO_$_HitGenerator
	.cstring
L_OBJC_METH_VAR_NAME_36:
	.ascii "countByEnumeratingWithState:objects:count:\0"
	.section __DATA, __objc_msgrefs, coalesced
	.section __DATA, __objc_data
	.section __DATA, __objc_const
	.section __DATA, __objc_classrefs, regular, no_dead_strip
	.section __DATA, __objc_classlist, regular, no_dead_strip
	.section __DATA, __objc_catlist, regular, no_dead_strip
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.section __DATA, __objc_nlclslist, regular, no_dead_strip
	.section __DATA, __objc_nlcatlist, regular, no_dead_strip
	.section __DATA, __objc_protolist, coalesced, no_dead_strip
	.section __DATA, __objc_protorefs, coalesced, no_dead_strip
	.section __DATA, __objc_superrefs, regular, no_dead_strip
	.section __DATA, __objc_imageinfo, regular, no_dead_strip
	.section __DATA, __objc_stringobj, regular, no_dead_strip
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_26:
	.long	L_OBJC_METH_VAR_NAME_36
	.cstring
L_OBJC_METH_VAR_NAME_37:
	.ascii "addObject:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_25:
	.long	L_OBJC_METH_VAR_NAME_37
	.cstring
L_OBJC_METH_VAR_NAME_38:
	.ascii "setSymbols:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_24:
	.long	L_OBJC_METH_VAR_NAME_38
	.cstring
L_OBJC_METH_VAR_NAME_39:
	.ascii "initWithCapacity:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_23:
	.long	L_OBJC_METH_VAR_NAME_39
	.cstring
L_OBJC_METH_VAR_NAME_40:
	.ascii "symbols\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_22:
	.long	L_OBJC_METH_VAR_NAME_40
	.cstring
L_OBJC_METH_VAR_NAME_41:
	.ascii "speed\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_21:
	.long	L_OBJC_METH_VAR_NAME_41
	.cstring
L_OBJC_METH_VAR_NAME_42:
	.ascii "character\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_20:
	.long	L_OBJC_METH_VAR_NAME_42
	.cstring
L_OBJC_METH_VAR_NAME_43:
	.ascii "index\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_19:
	.long	L_OBJC_METH_VAR_NAME_43
	.cstring
L_OBJC_METH_VAR_NAME_44:
	.ascii "replaceObjectAtIndex:withObject:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_18:
	.long	L_OBJC_METH_VAR_NAME_44
	.cstring
L_OBJC_METH_VAR_NAME_45:
	.ascii "initWithCharacter:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_17:
	.long	L_OBJC_METH_VAR_NAME_45
	.cstring
L_OBJC_METH_VAR_NAME_46:
	.ascii "characterAtIndex:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_16:
	.long	L_OBJC_METH_VAR_NAME_46
	.cstring
L_OBJC_METH_VAR_NAME_47:
	.ascii "alloc\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_15:
	.long	L_OBJC_METH_VAR_NAME_47
	.cstring
L_OBJC_METH_VAR_NAME_48:
	.ascii "emptySymbol\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_14:
	.long	L_OBJC_METH_VAR_NAME_48
	.cstring
L_OBJC_METH_VAR_NAME_49:
	.ascii "count\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_13:
	.long	L_OBJC_METH_VAR_NAME_49
	.cstring
L_OBJC_METH_VAR_NAME_50:
	.ascii "stringWithFormat:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_12:
	.long	L_OBJC_METH_VAR_NAME_50
	.cstring
L_OBJC_METH_VAR_NAME_51:
	.ascii "randomSymbol\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_11:
	.long	L_OBJC_METH_VAR_NAME_51
	.align 2
L_OBJC_SELECTOR_REFERENCES_10:
	.long	L_OBJC_METH_VAR_NAME_22
	.cstring
L_OBJC_METH_VAR_NAME_52:
	.ascii "objectAtIndex:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_9:
	.long	L_OBJC_METH_VAR_NAME_52
	.align 2
L_OBJC_SELECTOR_REFERENCES_8:
	.long	L_OBJC_METH_VAR_NAME_33
	.cstring
L_OBJC_METH_VAR_NAME_53:
	.ascii "init\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_7:
	.long	L_OBJC_METH_VAR_NAME_53
	.cstring
L_OBJC_METH_VAR_NAME_54:
	.ascii "performSelector:withObject:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_6:
	.long	L_OBJC_METH_VAR_NAME_54
	.cstring
L_OBJC_METH_VAR_NAME_55:
	.ascii "performSelector:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_5:
	.long	L_OBJC_METH_VAR_NAME_55
	.cstring
L_OBJC_METH_VAR_NAME_56:
	.ascii "release\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_4:
	.long	L_OBJC_METH_VAR_NAME_56
	.cstring
L_OBJC_METH_VAR_NAME_57:
	.ascii "handleFailureInFunction:file:lineNumber:description:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_3:
	.long	L_OBJC_METH_VAR_NAME_57
	.cstring
L_OBJC_METH_VAR_NAME_58:
	.ascii "stringWithUTF8String:\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_2:
	.long	L_OBJC_METH_VAR_NAME_58
	.cstring
L_OBJC_METH_VAR_NAME_59:
	.ascii "currentHandler\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_1:
	.long	L_OBJC_METH_VAR_NAME_59
	.cstring
L_OBJC_METH_VAR_NAME_60:
	.ascii "retain\0"
	.section __DATA, __objc_selrefs, literal_pointers, no_dead_strip
	.align 2
L_OBJC_SELECTOR_REFERENCES_0:
	.long	L_OBJC_METH_VAR_NAME_60
	.section __DATA, __objc_classrefs, regular, no_dead_strip
	.align 2
L_OBJC_CLASSLIST_REFERENCES_$_0:
	.long	_OBJC_CLASS_$_NSAssertionHandler
	.align 2
L_OBJC_CLASSLIST_REFERENCES_$_1:
	.long	_OBJC_CLASS_$_NSString
	.align 2
L_OBJC_CLASSLIST_REFERENCES_$_3:
	.long	_OBJC_CLASS_$_Symbol
	.align 2
L_OBJC_CLASSLIST_REFERENCES_$_4:
	.long	_OBJC_CLASS_$_NSMutableArray
	.section __DATA, __objc_superrefs, regular, no_dead_strip
	.align 2
L_OBJC_CLASSLIST_SUP_REFS_$_2:
	.long	_OBJC_CLASS_$_HitGenerator
	.private_extern _OBJC_IVAR_$_HitGenerator.hitString
.globl _OBJC_IVAR_$_HitGenerator.hitString
	.section __DATA, __objc_const
	.align 2
_OBJC_IVAR_$_HitGenerator.hitString:
	.long	48
	.private_extern _OBJC_IVAR_$_HitGenerator.jokerInterval
.globl _OBJC_IVAR_$_HitGenerator.jokerInterval
	.align 2
_OBJC_IVAR_$_HitGenerator.jokerInterval:
	.long	4
	.private_extern _OBJC_IVAR_$_HitGenerator.jokerHitCount
.globl _OBJC_IVAR_$_HitGenerator.jokerHitCount
	.align 2
_OBJC_IVAR_$_HitGenerator.jokerHitCount:
	.long	8
	.private_extern _OBJC_IVAR_$_HitGenerator.timeUpIndex
.globl _OBJC_IVAR_$_HitGenerator.timeUpIndex
	.align 2
_OBJC_IVAR_$_HitGenerator.timeUpIndex:
	.long	12
	.private_extern _OBJC_IVAR_$_HitGenerator.liveInterval
.globl _OBJC_IVAR_$_HitGenerator.liveInterval
	.align 2
_OBJC_IVAR_$_HitGenerator.liveInterval:
	.long	16
	.private_extern _OBJC_IVAR_$_HitGenerator.liveHitCount
.globl _OBJC_IVAR_$_HitGenerator.liveHitCount
	.align 2
_OBJC_IVAR_$_HitGenerator.liveHitCount:
	.long	20
	.private_extern _OBJC_IVAR_$_HitGenerator.maxTries
.globl _OBJC_IVAR_$_HitGenerator.maxTries
	.align 2
_OBJC_IVAR_$_HitGenerator.maxTries:
	.long	24
	.private_extern _OBJC_IVAR_$_HitGenerator.minHits
.globl _OBJC_IVAR_$_HitGenerator.minHits
	.align 2
_OBJC_IVAR_$_HitGenerator.minHits:
	.long	28
	.private_extern _OBJC_IVAR_$_HitGenerator.rows
.globl _OBJC_IVAR_$_HitGenerator.rows
	.align 2
_OBJC_IVAR_$_HitGenerator.rows:
	.long	32
	.private_extern _OBJC_IVAR_$_HitGenerator.trioStairRatio
.globl _OBJC_IVAR_$_HitGenerator.trioStairRatio
	.align 2
_OBJC_IVAR_$_HitGenerator.trioStairRatio:
	.long	36
	.private_extern _OBJC_IVAR_$_HitGenerator.timeRewards
.globl _OBJC_IVAR_$_HitGenerator.timeRewards
	.align 2
_OBJC_IVAR_$_HitGenerator.timeRewards:
	.long	40
	.private_extern _OBJC_IVAR_$_HitGenerator.generationIndex
.globl _OBJC_IVAR_$_HitGenerator.generationIndex
	.align 2
_OBJC_IVAR_$_HitGenerator.generationIndex:
	.long	44
	.private_extern _OBJC_IVAR_$_HitGenerator.isHit
.globl _OBJC_IVAR_$_HitGenerator.isHit
	.align 2
_OBJC_IVAR_$_HitGenerator.isHit:
	.long	52
	.private_extern _OBJC_IVAR_$_HitGenerator.jokerHitStatus
.globl _OBJC_IVAR_$_HitGenerator.jokerHitStatus
	.align 2
_OBJC_IVAR_$_HitGenerator.jokerHitStatus:
	.long	56
	.private_extern _OBJC_IVAR_$_HitGenerator.liveHitStatus
.globl _OBJC_IVAR_$_HitGenerator.liveHitStatus
	.align 2
_OBJC_IVAR_$_HitGenerator.liveHitStatus:
	.long	60
	.private_extern _OBJC_IVAR_$_HitGenerator.typeHit
.globl _OBJC_IVAR_$_HitGenerator.typeHit
	.align 2
_OBJC_IVAR_$_HitGenerator.typeHit:
	.long	64
	.private_extern _OBJC_IVAR_$_HitGenerator.jokerIndex
.globl _OBJC_IVAR_$_HitGenerator.jokerIndex
	.align 2
_OBJC_IVAR_$_HitGenerator.jokerIndex:
	.long	68
	.private_extern _OBJC_IVAR_$_HitGenerator.liveIndex
.globl _OBJC_IVAR_$_HitGenerator.liveIndex
	.align 2
_OBJC_IVAR_$_HitGenerator.liveIndex:
	.long	72
	.private_extern _OBJC_IVAR_$_HitGenerator.timeRewardIndex
.globl _OBJC_IVAR_$_HitGenerator.timeRewardIndex
	.align 2
_OBJC_IVAR_$_HitGenerator.timeRewardIndex:
	.long	76
	.private_extern _OBJC_IVAR_$_HitGenerator.tracks
.globl _OBJC_IVAR_$_HitGenerator.tracks
	.align 2
_OBJC_IVAR_$_HitGenerator.tracks:
	.long	80
	.private_extern _OBJC_IVAR_$_HitGenerator.hits
.globl _OBJC_IVAR_$_HitGenerator.hits
	.align 2
_OBJC_IVAR_$_HitGenerator.hits:
	.long	84
	.private_extern _OBJC_IVAR_$_HitGenerator.tries
.globl _OBJC_IVAR_$_HitGenerator.tries
	.align 2
_OBJC_IVAR_$_HitGenerator.tries:
	.long	88
	.section __DATA, __objc_classlist, regular, no_dead_strip
	.align 2
L_OBJC_LABEL_CLASS_$:
	.long	_OBJC_CLASS_$_HitGenerator
	.section __DATA, __objc_imageinfo, regular, no_dead_strip
	.align 2
L_OBJC_IMAGE_INFO:
	.long	0
	.long	16
	.objc_class_name_HitGenerator=0
.globl .objc_class_name_HitGenerator
	.const
	.align 4
LC2:
	.long	0
	.long	1105199104
	.long	0
	.long	0
	.literal4
	.align 2
LC13:
	.long	0
	.section __DWARF,__debug_frame,regular,debug
Lframe0:
	.set L$set$0,LECIE0-LSCIE0
	.long L$set$0
LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.ascii "\0"
	.byte	0x1
	.byte	0x7c
	.byte	0x8
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0x88
	.byte	0x1
	.align 2
LECIE0:
LSFDE0:
	.set L$set$1,LEFDE0-LASFDE0
	.long L$set$1
LASFDE0:
	.set L$set$2,Lframe0-Lsection__debug_frame
	.long L$set$2
	.long	LFB211
	.set L$set$3,LFE211-LFB211
	.long L$set$3
	.byte	0x4
	.set L$set$4,LCFI0-LFB211
	.long L$set$4
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$5,LCFI1-LCFI0
	.long L$set$5
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$6,LCFI3-LCFI1
	.long L$set$6
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE0:
LSFDE2:
	.set L$set$7,LEFDE2-LASFDE2
	.long L$set$7
LASFDE2:
	.set L$set$8,Lframe0-Lsection__debug_frame
	.long L$set$8
	.long	LFB212
	.set L$set$9,LFE212-LFB212
	.long L$set$9
	.byte	0x4
	.set L$set$10,LCFI4-LFB212
	.long L$set$10
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$11,LCFI5-LCFI4
	.long L$set$11
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$12,LCFI7-LCFI5
	.long L$set$12
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE2:
LSFDE4:
	.set L$set$13,LEFDE4-LASFDE4
	.long L$set$13
LASFDE4:
	.set L$set$14,Lframe0-Lsection__debug_frame
	.long L$set$14
	.long	LFB213
	.set L$set$15,LFE213-LFB213
	.long L$set$15
	.byte	0x4
	.set L$set$16,LCFI8-LFB213
	.long L$set$16
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$17,LCFI9-LCFI8
	.long L$set$17
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$18,LCFI13-LCFI9
	.long L$set$18
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE4:
LSFDE6:
	.set L$set$19,LEFDE6-LASFDE6
	.long L$set$19
LASFDE6:
	.set L$set$20,Lframe0-Lsection__debug_frame
	.long L$set$20
	.long	LFB214
	.set L$set$21,LFE214-LFB214
	.long L$set$21
	.byte	0x4
	.set L$set$22,LCFI14-LFB214
	.long L$set$22
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$23,LCFI15-LCFI14
	.long L$set$23
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$24,LCFI19-LCFI15
	.long L$set$24
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE6:
LSFDE8:
	.set L$set$25,LEFDE8-LASFDE8
	.long L$set$25
LASFDE8:
	.set L$set$26,Lframe0-Lsection__debug_frame
	.long L$set$26
	.long	LFB215
	.set L$set$27,LFE215-LFB215
	.long L$set$27
	.byte	0x4
	.set L$set$28,LCFI20-LFB215
	.long L$set$28
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$29,LCFI21-LCFI20
	.long L$set$29
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE8:
LSFDE10:
	.set L$set$30,LEFDE10-LASFDE10
	.long L$set$30
LASFDE10:
	.set L$set$31,Lframe0-Lsection__debug_frame
	.long L$set$31
	.long	LFB216
	.set L$set$32,LFE216-LFB216
	.long L$set$32
	.byte	0x4
	.set L$set$33,LCFI23-LFB216
	.long L$set$33
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$34,LCFI24-LCFI23
	.long L$set$34
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE10:
LSFDE12:
	.set L$set$35,LEFDE12-LASFDE12
	.long L$set$35
LASFDE12:
	.set L$set$36,Lframe0-Lsection__debug_frame
	.long L$set$36
	.long	LFB217
	.set L$set$37,LFE217-LFB217
	.long L$set$37
	.byte	0x4
	.set L$set$38,LCFI26-LFB217
	.long L$set$38
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$39,LCFI27-LCFI26
	.long L$set$39
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE12:
LSFDE14:
	.set L$set$40,LEFDE14-LASFDE14
	.long L$set$40
LASFDE14:
	.set L$set$41,Lframe0-Lsection__debug_frame
	.long L$set$41
	.long	LFB218
	.set L$set$42,LFE218-LFB218
	.long L$set$42
	.byte	0x4
	.set L$set$43,LCFI29-LFB218
	.long L$set$43
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$44,LCFI30-LCFI29
	.long L$set$44
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE14:
LSFDE16:
	.set L$set$45,LEFDE16-LASFDE16
	.long L$set$45
LASFDE16:
	.set L$set$46,Lframe0-Lsection__debug_frame
	.long L$set$46
	.long	LFB219
	.set L$set$47,LFE219-LFB219
	.long L$set$47
	.byte	0x4
	.set L$set$48,LCFI32-LFB219
	.long L$set$48
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$49,LCFI33-LCFI32
	.long L$set$49
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE16:
LSFDE18:
	.set L$set$50,LEFDE18-LASFDE18
	.long L$set$50
LASFDE18:
	.set L$set$51,Lframe0-Lsection__debug_frame
	.long L$set$51
	.long	LFB220
	.set L$set$52,LFE220-LFB220
	.long L$set$52
	.byte	0x4
	.set L$set$53,LCFI35-LFB220
	.long L$set$53
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$54,LCFI36-LCFI35
	.long L$set$54
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE18:
LSFDE20:
	.set L$set$55,LEFDE20-LASFDE20
	.long L$set$55
LASFDE20:
	.set L$set$56,Lframe0-Lsection__debug_frame
	.long L$set$56
	.long	LFB221
	.set L$set$57,LFE221-LFB221
	.long L$set$57
	.byte	0x4
	.set L$set$58,LCFI38-LFB221
	.long L$set$58
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$59,LCFI39-LCFI38
	.long L$set$59
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE20:
LSFDE22:
	.set L$set$60,LEFDE22-LASFDE22
	.long L$set$60
LASFDE22:
	.set L$set$61,Lframe0-Lsection__debug_frame
	.long L$set$61
	.long	LFB222
	.set L$set$62,LFE222-LFB222
	.long L$set$62
	.byte	0x4
	.set L$set$63,LCFI41-LFB222
	.long L$set$63
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$64,LCFI42-LCFI41
	.long L$set$64
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE22:
LSFDE24:
	.set L$set$65,LEFDE24-LASFDE24
	.long L$set$65
LASFDE24:
	.set L$set$66,Lframe0-Lsection__debug_frame
	.long L$set$66
	.long	LFB223
	.set L$set$67,LFE223-LFB223
	.long L$set$67
	.byte	0x4
	.set L$set$68,LCFI44-LFB223
	.long L$set$68
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$69,LCFI45-LCFI44
	.long L$set$69
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE24:
LSFDE26:
	.set L$set$70,LEFDE26-LASFDE26
	.long L$set$70
LASFDE26:
	.set L$set$71,Lframe0-Lsection__debug_frame
	.long L$set$71
	.long	LFB224
	.set L$set$72,LFE224-LFB224
	.long L$set$72
	.byte	0x4
	.set L$set$73,LCFI47-LFB224
	.long L$set$73
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$74,LCFI48-LCFI47
	.long L$set$74
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE26:
LSFDE28:
	.set L$set$75,LEFDE28-LASFDE28
	.long L$set$75
LASFDE28:
	.set L$set$76,Lframe0-Lsection__debug_frame
	.long L$set$76
	.long	LFB225
	.set L$set$77,LFE225-LFB225
	.long L$set$77
	.byte	0x4
	.set L$set$78,LCFI50-LFB225
	.long L$set$78
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$79,LCFI51-LCFI50
	.long L$set$79
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE28:
LSFDE30:
	.set L$set$80,LEFDE30-LASFDE30
	.long L$set$80
LASFDE30:
	.set L$set$81,Lframe0-Lsection__debug_frame
	.long L$set$81
	.long	LFB226
	.set L$set$82,LFE226-LFB226
	.long L$set$82
	.byte	0x4
	.set L$set$83,LCFI53-LFB226
	.long L$set$83
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$84,LCFI54-LCFI53
	.long L$set$84
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE30:
LSFDE32:
	.set L$set$85,LEFDE32-LASFDE32
	.long L$set$85
LASFDE32:
	.set L$set$86,Lframe0-Lsection__debug_frame
	.long L$set$86
	.long	LFB227
	.set L$set$87,LFE227-LFB227
	.long L$set$87
	.byte	0x4
	.set L$set$88,LCFI56-LFB227
	.long L$set$88
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$89,LCFI57-LCFI56
	.long L$set$89
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE32:
LSFDE34:
	.set L$set$90,LEFDE34-LASFDE34
	.long L$set$90
LASFDE34:
	.set L$set$91,Lframe0-Lsection__debug_frame
	.long L$set$91
	.long	LFB228
	.set L$set$92,LFE228-LFB228
	.long L$set$92
	.byte	0x4
	.set L$set$93,LCFI59-LFB228
	.long L$set$93
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$94,LCFI60-LCFI59
	.long L$set$94
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE34:
LSFDE36:
	.set L$set$95,LEFDE36-LASFDE36
	.long L$set$95
LASFDE36:
	.set L$set$96,Lframe0-Lsection__debug_frame
	.long L$set$96
	.long	LFB229
	.set L$set$97,LFE229-LFB229
	.long L$set$97
	.byte	0x4
	.set L$set$98,LCFI62-LFB229
	.long L$set$98
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$99,LCFI63-LCFI62
	.long L$set$99
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE36:
LSFDE38:
	.set L$set$100,LEFDE38-LASFDE38
	.long L$set$100
LASFDE38:
	.set L$set$101,Lframe0-Lsection__debug_frame
	.long L$set$101
	.long	LFB230
	.set L$set$102,LFE230-LFB230
	.long L$set$102
	.byte	0x4
	.set L$set$103,LCFI65-LFB230
	.long L$set$103
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$104,LCFI66-LCFI65
	.long L$set$104
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE38:
LSFDE40:
	.set L$set$105,LEFDE40-LASFDE40
	.long L$set$105
LASFDE40:
	.set L$set$106,Lframe0-Lsection__debug_frame
	.long L$set$106
	.long	LFB231
	.set L$set$107,LFE231-LFB231
	.long L$set$107
	.byte	0x4
	.set L$set$108,LCFI68-LFB231
	.long L$set$108
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$109,LCFI69-LCFI68
	.long L$set$109
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE40:
LSFDE42:
	.set L$set$110,LEFDE42-LASFDE42
	.long L$set$110
LASFDE42:
	.set L$set$111,Lframe0-Lsection__debug_frame
	.long L$set$111
	.long	LFB232
	.set L$set$112,LFE232-LFB232
	.long L$set$112
	.byte	0x4
	.set L$set$113,LCFI71-LFB232
	.long L$set$113
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$114,LCFI72-LCFI71
	.long L$set$114
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE42:
LSFDE44:
	.set L$set$115,LEFDE44-LASFDE44
	.long L$set$115
LASFDE44:
	.set L$set$116,Lframe0-Lsection__debug_frame
	.long L$set$116
	.long	LFB233
	.set L$set$117,LFE233-LFB233
	.long L$set$117
	.byte	0x4
	.set L$set$118,LCFI74-LFB233
	.long L$set$118
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$119,LCFI75-LCFI74
	.long L$set$119
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$120,LCFI77-LCFI75
	.long L$set$120
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE44:
LSFDE46:
	.set L$set$121,LEFDE46-LASFDE46
	.long L$set$121
LASFDE46:
	.set L$set$122,Lframe0-Lsection__debug_frame
	.long L$set$122
	.long	LFB234
	.set L$set$123,LFE234-LFB234
	.long L$set$123
	.byte	0x4
	.set L$set$124,LCFI78-LFB234
	.long L$set$124
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$125,LCFI79-LCFI78
	.long L$set$125
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$126,LCFI81-LCFI79
	.long L$set$126
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE46:
"-[HitGenerator timeUpIndex].eh" = 0
.no_dead_strip "-[HitGenerator timeUpIndex].eh"
"-[HitGenerator setTimeUpIndex:].eh" = 0
.no_dead_strip "-[HitGenerator setTimeUpIndex:].eh"
"-[HitGenerator timeRewards].eh" = 0
.no_dead_strip "-[HitGenerator timeRewards].eh"
"-[HitGenerator setTimeRewards:].eh" = 0
.no_dead_strip "-[HitGenerator setTimeRewards:].eh"
"-[HitGenerator trioStairRatio].eh" = 0
.no_dead_strip "-[HitGenerator trioStairRatio].eh"
"-[HitGenerator setTrioStairRatio:].eh" = 0
.no_dead_strip "-[HitGenerator setTrioStairRatio:].eh"
"-[HitGenerator maxTries].eh" = 0
.no_dead_strip "-[HitGenerator maxTries].eh"
"-[HitGenerator setMaxTries:].eh" = 0
.no_dead_strip "-[HitGenerator setMaxTries:].eh"
"-[HitGenerator minHits].eh" = 0
.no_dead_strip "-[HitGenerator minHits].eh"
"-[HitGenerator setMinHits:].eh" = 0
.no_dead_strip "-[HitGenerator setMinHits:].eh"
"-[HitGenerator liveInterval].eh" = 0
.no_dead_strip "-[HitGenerator liveInterval].eh"
"-[HitGenerator setLiveInterval:].eh" = 0
.no_dead_strip "-[HitGenerator setLiveInterval:].eh"
"-[HitGenerator liveHitCount].eh" = 0
.no_dead_strip "-[HitGenerator liveHitCount].eh"
"-[HitGenerator setLiveHitCount:].eh" = 0
.no_dead_strip "-[HitGenerator setLiveHitCount:].eh"
"-[HitGenerator jokerInterval].eh" = 0
.no_dead_strip "-[HitGenerator jokerInterval].eh"
"-[HitGenerator setJokerInterval:].eh" = 0
.no_dead_strip "-[HitGenerator setJokerInterval:].eh"
"-[HitGenerator jokerHitCount].eh" = 0
.no_dead_strip "-[HitGenerator jokerHitCount].eh"
"-[HitGenerator setJokerHitCount:].eh" = 0
.no_dead_strip "-[HitGenerator setJokerHitCount:].eh"
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$127,LECIE1-LSCIE1
	.long L$set$127
LSCIE1:
	.long	0x0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x7c
	.byte	0x8
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x5
	.byte	0x4
	.byte	0x88
	.byte	0x1
	.align 2
LECIE1:
"-[HitGenerator initWithTracks:rows:].eh":
LSFDE1:
	.set L$set$128,LEFDE1-LASFDE1
	.long L$set$128
LASFDE1:
	.long	LASFDE1-EH_frame1
	.long	LFB211-.
	.set L$set$129,LFE211-LFB211
	.long L$set$129
	.byte	0x0
	.byte	0x4
	.set L$set$130,LCFI0-LFB211
	.long L$set$130
	.byte	0xe
	.byte	0x8
	.byte	0x84
	.byte	0x2
	.byte	0x4
	.set L$set$131,LCFI1-LCFI0
	.long L$set$131
	.byte	0xd
	.byte	0x4
	.byte	0x4
	.set L$set$132,LCFI3-LCFI1
	.long L$set$132
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE1:
"-[HitGenerator generateHits:].eh":
LSFDE3:
	.set L$set$133,LEFDE3-LASFDE3
	.long L$set$133
LASFDE3:
	.long	LASFDE3-EH_frame1
	.long	LFB212-.
	.set L$set$134,LFE212-LFB212
	.long L$set$134
	.byte	0x0
	.byte	0x4
	.set L$set$135,LCFI4-LFB212
	.long L$set$135
	.byte	0xe
	.byte	0x8
	.byte	0x84
	.byte	0x2
	.byte	0x4
	.set L$set$136,LCFI5-LCFI4
	.long L$set$136
	.byte	0xd
	.byte	0x4
	.byte	0x4
	.set L$set$137,LCFI7-LCFI5
	.long L$set$137
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE3:
"-[HitGenerator generateHits].eh":
LSFDE5:
	.set L$set$138,LEFDE5-LASFDE5
	.long L$set$138
LASFDE5:
	.long	LASFDE5-EH_frame1
	.long	LFB213-.
	.set L$set$139,LFE213-LFB213
	.long L$set$139
	.byte	0x0
	.byte	0x4
	.set L$set$140,LCFI8-LFB213
	.long L$set$140
	.byte	0xe
	.byte	0x8
	.byte	0x84
	.byte	0x2
	.byte	0x4
	.set L$set$141,LCFI9-LCFI8
	.long L$set$141
	.byte	0xd
	.byte	0x4
	.byte	0x4
	.set L$set$142,LCFI13-LCFI9
	.long L$set$142
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE5:
"-[HitGenerator initSymbolArrays:].eh":
LSFDE7:
	.set L$set$143,LEFDE7-LASFDE7
	.long L$set$143
LASFDE7:
	.long	LASFDE7-EH_frame1
	.long	LFB214-.
	.set L$set$144,LFE214-LFB214
	.long L$set$144
	.byte	0x0
	.byte	0x4
	.set L$set$145,LCFI14-LFB214
	.long L$set$145
	.byte	0xe
	.byte	0x8
	.byte	0x84
	.byte	0x2
	.byte	0x4
	.set L$set$146,LCFI15-LCFI14
	.long L$set$146
	.byte	0xd
	.byte	0x4
	.byte	0x4
	.set L$set$147,LCFI19-LCFI15
	.long L$set$147
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE7:
"-[HitGenerator hitString].eh":
LSFDE45:
	.set L$set$148,LEFDE45-LASFDE45
	.long L$set$148
LASFDE45:
	.long	LASFDE45-EH_frame1
	.long	LFB233-.
	.set L$set$149,LFE233-LFB233
	.long L$set$149
	.byte	0x0
	.byte	0x4
	.set L$set$150,LCFI74-LFB233
	.long L$set$150
	.byte	0xe
	.byte	0x8
	.byte	0x84
	.byte	0x2
	.byte	0x4
	.set L$set$151,LCFI75-LCFI74
	.long L$set$151
	.byte	0xd
	.byte	0x4
	.byte	0x4
	.set L$set$152,LCFI77-LCFI75
	.long L$set$152
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE45:
"-[HitGenerator setHitString:].eh":
LSFDE47:
	.set L$set$153,LEFDE47-LASFDE47
	.long L$set$153
LASFDE47:
	.long	LASFDE47-EH_frame1
	.long	LFB234-.
	.set L$set$154,LFE234-LFB234
	.long L$set$154
	.byte	0x0
	.byte	0x4
	.set L$set$155,LCFI78-LFB234
	.long L$set$155
	.byte	0xe
	.byte	0x8
	.byte	0x84
	.byte	0x2
	.byte	0x4
	.set L$set$156,LCFI79-LCFI78
	.long L$set$156
	.byte	0xd
	.byte	0x4
	.byte	0x4
	.set L$set$157,LCFI81-LCFI79
	.long L$set$157
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE47:
	.text
Letext0:
	.section __DWARF,__debug_loc,regular,debug
Ldebug_loc0:
LLST0:
	.set L$set$158,LFB211-Ltext0
	.long L$set$158
	.set L$set$159,LCFI0-Ltext0
	.long L$set$159
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$160,LCFI0-Ltext0
	.long L$set$160
	.set L$set$161,LCFI1-Ltext0
	.long L$set$161
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$162,LCFI1-Ltext0
	.long L$set$162
	.set L$set$163,LFE211-Ltext0
	.long L$set$163
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST1:
	.set L$set$164,LFB212-Ltext0
	.long L$set$164
	.set L$set$165,LCFI4-Ltext0
	.long L$set$165
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$166,LCFI4-Ltext0
	.long L$set$166
	.set L$set$167,LCFI5-Ltext0
	.long L$set$167
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$168,LCFI5-Ltext0
	.long L$set$168
	.set L$set$169,LFE212-Ltext0
	.long L$set$169
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST2:
	.set L$set$170,LFB213-Ltext0
	.long L$set$170
	.set L$set$171,LCFI8-Ltext0
	.long L$set$171
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$172,LCFI8-Ltext0
	.long L$set$172
	.set L$set$173,LCFI9-Ltext0
	.long L$set$173
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$174,LCFI9-Ltext0
	.long L$set$174
	.set L$set$175,LFE213-Ltext0
	.long L$set$175
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST3:
	.set L$set$176,LFB214-Ltext0
	.long L$set$176
	.set L$set$177,LCFI14-Ltext0
	.long L$set$177
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$178,LCFI14-Ltext0
	.long L$set$178
	.set L$set$179,LCFI15-Ltext0
	.long L$set$179
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$180,LCFI15-Ltext0
	.long L$set$180
	.set L$set$181,LFE214-Ltext0
	.long L$set$181
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST4:
	.set L$set$182,LFB215-Ltext0
	.long L$set$182
	.set L$set$183,LCFI20-Ltext0
	.long L$set$183
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$184,LCFI20-Ltext0
	.long L$set$184
	.set L$set$185,LCFI21-Ltext0
	.long L$set$185
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$186,LCFI21-Ltext0
	.long L$set$186
	.set L$set$187,LFE215-Ltext0
	.long L$set$187
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST5:
	.set L$set$188,LFB216-Ltext0
	.long L$set$188
	.set L$set$189,LCFI23-Ltext0
	.long L$set$189
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$190,LCFI23-Ltext0
	.long L$set$190
	.set L$set$191,LCFI24-Ltext0
	.long L$set$191
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$192,LCFI24-Ltext0
	.long L$set$192
	.set L$set$193,LFE216-Ltext0
	.long L$set$193
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST6:
	.set L$set$194,LFB217-Ltext0
	.long L$set$194
	.set L$set$195,LCFI26-Ltext0
	.long L$set$195
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$196,LCFI26-Ltext0
	.long L$set$196
	.set L$set$197,LCFI27-Ltext0
	.long L$set$197
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$198,LCFI27-Ltext0
	.long L$set$198
	.set L$set$199,LFE217-Ltext0
	.long L$set$199
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST7:
	.set L$set$200,LFB218-Ltext0
	.long L$set$200
	.set L$set$201,LCFI29-Ltext0
	.long L$set$201
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$202,LCFI29-Ltext0
	.long L$set$202
	.set L$set$203,LCFI30-Ltext0
	.long L$set$203
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$204,LCFI30-Ltext0
	.long L$set$204
	.set L$set$205,LFE218-Ltext0
	.long L$set$205
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST8:
	.set L$set$206,LFB219-Ltext0
	.long L$set$206
	.set L$set$207,LCFI32-Ltext0
	.long L$set$207
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$208,LCFI32-Ltext0
	.long L$set$208
	.set L$set$209,LCFI33-Ltext0
	.long L$set$209
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$210,LCFI33-Ltext0
	.long L$set$210
	.set L$set$211,LFE219-Ltext0
	.long L$set$211
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST9:
	.set L$set$212,LFB220-Ltext0
	.long L$set$212
	.set L$set$213,LCFI35-Ltext0
	.long L$set$213
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$214,LCFI35-Ltext0
	.long L$set$214
	.set L$set$215,LCFI36-Ltext0
	.long L$set$215
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$216,LCFI36-Ltext0
	.long L$set$216
	.set L$set$217,LFE220-Ltext0
	.long L$set$217
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST10:
	.set L$set$218,LFB221-Ltext0
	.long L$set$218
	.set L$set$219,LCFI38-Ltext0
	.long L$set$219
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$220,LCFI38-Ltext0
	.long L$set$220
	.set L$set$221,LCFI39-Ltext0
	.long L$set$221
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$222,LCFI39-Ltext0
	.long L$set$222
	.set L$set$223,LFE221-Ltext0
	.long L$set$223
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST11:
	.set L$set$224,LFB222-Ltext0
	.long L$set$224
	.set L$set$225,LCFI41-Ltext0
	.long L$set$225
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$226,LCFI41-Ltext0
	.long L$set$226
	.set L$set$227,LCFI42-Ltext0
	.long L$set$227
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$228,LCFI42-Ltext0
	.long L$set$228
	.set L$set$229,LFE222-Ltext0
	.long L$set$229
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST12:
	.set L$set$230,LFB223-Ltext0
	.long L$set$230
	.set L$set$231,LCFI44-Ltext0
	.long L$set$231
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$232,LCFI44-Ltext0
	.long L$set$232
	.set L$set$233,LCFI45-Ltext0
	.long L$set$233
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$234,LCFI45-Ltext0
	.long L$set$234
	.set L$set$235,LFE223-Ltext0
	.long L$set$235
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST13:
	.set L$set$236,LFB224-Ltext0
	.long L$set$236
	.set L$set$237,LCFI47-Ltext0
	.long L$set$237
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$238,LCFI47-Ltext0
	.long L$set$238
	.set L$set$239,LCFI48-Ltext0
	.long L$set$239
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$240,LCFI48-Ltext0
	.long L$set$240
	.set L$set$241,LFE224-Ltext0
	.long L$set$241
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST14:
	.set L$set$242,LFB225-Ltext0
	.long L$set$242
	.set L$set$243,LCFI50-Ltext0
	.long L$set$243
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$244,LCFI50-Ltext0
	.long L$set$244
	.set L$set$245,LCFI51-Ltext0
	.long L$set$245
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$246,LCFI51-Ltext0
	.long L$set$246
	.set L$set$247,LFE225-Ltext0
	.long L$set$247
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST15:
	.set L$set$248,LFB226-Ltext0
	.long L$set$248
	.set L$set$249,LCFI53-Ltext0
	.long L$set$249
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$250,LCFI53-Ltext0
	.long L$set$250
	.set L$set$251,LCFI54-Ltext0
	.long L$set$251
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$252,LCFI54-Ltext0
	.long L$set$252
	.set L$set$253,LFE226-Ltext0
	.long L$set$253
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST16:
	.set L$set$254,LFB227-Ltext0
	.long L$set$254
	.set L$set$255,LCFI56-Ltext0
	.long L$set$255
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$256,LCFI56-Ltext0
	.long L$set$256
	.set L$set$257,LCFI57-Ltext0
	.long L$set$257
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$258,LCFI57-Ltext0
	.long L$set$258
	.set L$set$259,LFE227-Ltext0
	.long L$set$259
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST17:
	.set L$set$260,LFB228-Ltext0
	.long L$set$260
	.set L$set$261,LCFI59-Ltext0
	.long L$set$261
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$262,LCFI59-Ltext0
	.long L$set$262
	.set L$set$263,LCFI60-Ltext0
	.long L$set$263
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$264,LCFI60-Ltext0
	.long L$set$264
	.set L$set$265,LFE228-Ltext0
	.long L$set$265
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST18:
	.set L$set$266,LFB229-Ltext0
	.long L$set$266
	.set L$set$267,LCFI62-Ltext0
	.long L$set$267
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$268,LCFI62-Ltext0
	.long L$set$268
	.set L$set$269,LCFI63-Ltext0
	.long L$set$269
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$270,LCFI63-Ltext0
	.long L$set$270
	.set L$set$271,LFE229-Ltext0
	.long L$set$271
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST19:
	.set L$set$272,LFB230-Ltext0
	.long L$set$272
	.set L$set$273,LCFI65-Ltext0
	.long L$set$273
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$274,LCFI65-Ltext0
	.long L$set$274
	.set L$set$275,LCFI66-Ltext0
	.long L$set$275
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$276,LCFI66-Ltext0
	.long L$set$276
	.set L$set$277,LFE230-Ltext0
	.long L$set$277
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST20:
	.set L$set$278,LFB231-Ltext0
	.long L$set$278
	.set L$set$279,LCFI68-Ltext0
	.long L$set$279
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$280,LCFI68-Ltext0
	.long L$set$280
	.set L$set$281,LCFI69-Ltext0
	.long L$set$281
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$282,LCFI69-Ltext0
	.long L$set$282
	.set L$set$283,LFE231-Ltext0
	.long L$set$283
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST21:
	.set L$set$284,LFB232-Ltext0
	.long L$set$284
	.set L$set$285,LCFI71-Ltext0
	.long L$set$285
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$286,LCFI71-Ltext0
	.long L$set$286
	.set L$set$287,LCFI72-Ltext0
	.long L$set$287
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$288,LCFI72-Ltext0
	.long L$set$288
	.set L$set$289,LFE232-Ltext0
	.long L$set$289
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST22:
	.set L$set$290,LFB233-Ltext0
	.long L$set$290
	.set L$set$291,LCFI74-Ltext0
	.long L$set$291
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$292,LCFI74-Ltext0
	.long L$set$292
	.set L$set$293,LCFI75-Ltext0
	.long L$set$293
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$294,LCFI75-Ltext0
	.long L$set$294
	.set L$set$295,LFE233-Ltext0
	.long L$set$295
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST23:
	.set L$set$296,LFB234-Ltext0
	.long L$set$296
	.set L$set$297,LCFI78-Ltext0
	.long L$set$297
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$298,LCFI78-Ltext0
	.long L$set$298
	.set L$set$299,LCFI79-Ltext0
	.long L$set$299
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$300,LCFI79-Ltext0
	.long L$set$300
	.set L$set$301,LFE234-Ltext0
	.long L$set$301
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
	.file 2 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/usr/include/i386/_types.h"
	.file 3 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/usr/include/runetype.h"
	.file 4 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/usr/include/objc/objc.h"
	.file 5 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSObjCRuntime.h"
	.file 6 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSObject.h"
	.file 7 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSEnumerator.h"
	.file 8 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSArray.h"
	.file 9 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSString.h"
	.file 10 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSDateFormatter.h"
	.file 11 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSValue.h"
	.file 12 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGBase.h"
	.file 13 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGAffineTransform.h"
	.file 14 "<built-in>"
	.file 15 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGGeometry.h"
	.file 16 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.1.sdk/System/Library/Frameworks/OpenGLES.framework/Headers/ES1/gl.h"
	.file 17 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/ccTypes.h"
	.file 18 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCAction.h"
	.file 19 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCNode.h"
	.file 20 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/Support/ccCArray.h"
	.file 21 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCTexture2D.h"
	.file 22 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/Support/CCArray.h"
	.file 23 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCCamera.h"
	.file 24 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCGrid.h"
	.file 25 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCGrabber.h"
	.file 26 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCTextureAtlas.h"
	.file 27 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCSprite.h"
	.file 28 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCSpriteBatchNode.h"
	.file 29 "/Users/fpadilla/Documents/iphone/iNigma/libs/cocos2d/CCLayer.h"
	.file 30 "/Users/fpadilla/Documents/iphone/iNigma/Classes/Symbol.h"
	.file 31 "/Users/fpadilla/Documents/iphone/iNigma/Classes/Track.h"
	.file 32 "/Users/fpadilla/Documents/iphone/iNigma/HitGenerator.h"
	.file 33 "/Users/fpadilla/Documents/iphone/iNigma/libs/CocosDenshion/CDAudioManager.h"
	.section __DWARF,__debug_info,regular,debug
	.long	0x262c
	.word	0x2
	.set L$set$302,Ldebug_abbrev0-Lsection__debug_abbrev
	.long L$set$302
	.byte	0x4
	.byte	0x1
	.ascii "GNU Objective-C 4.2.1 (Apple Inc. build 5664)\0"
	.byte	0x10
	.ascii "/Users/fpadilla/Documents/iphone/iNigma/HitGenerator.m\0"
	.byte	0x2
	.long	Ltext0
	.long	Letext0
	.set L$set$303,Ldebug_line0-Lsection__debug_line
	.long L$set$303
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.byte	0x3
	.ascii "__uint32_t\0"
	.byte	0x2
	.byte	0x2d
	.long	0xdb
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.byte	0x3
	.ascii "__darwin_size_t\0"
	.byte	0x2
	.byte	0x5a
	.long	0x144
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.byte	0x3
	.ascii "__darwin_wchar_t\0"
	.byte	0x2
	.byte	0x66
	.long	0xc2
	.byte	0x3
	.ascii "__darwin_rune_t\0"
	.byte	0x2
	.byte	0x6b
	.long	0x159
	.byte	0x5
	.byte	0x4
	.byte	0x6
	.long	0x125
	.long	0x19a
	.byte	0x7
	.long	0x122
	.byte	0x7
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x125
	.byte	0x9
	.byte	0x10
	.byte	0x3
	.byte	0x51
	.long	0x1eb
	.byte	0xa
	.ascii "__min\0"
	.byte	0x3
	.byte	0x52
	.long	0x171
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__max\0"
	.byte	0x3
	.byte	0x53
	.long	0x171
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "__map\0"
	.byte	0x3
	.byte	0x54
	.long	0x171
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "__types\0"
	.byte	0x3
	.byte	0x55
	.long	0x1eb
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xc9
	.byte	0x3
	.ascii "_RuneEntry\0"
	.byte	0x3
	.byte	0x56
	.long	0x1a0
	.byte	0x9
	.byte	0x8
	.byte	0x3
	.byte	0x58
	.long	0x233
	.byte	0xa
	.ascii "__nranges\0"
	.byte	0x3
	.byte	0x59
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__ranges\0"
	.byte	0x3
	.byte	0x5a
	.long	0x233
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1f1
	.byte	0x3
	.ascii "_RuneRange\0"
	.byte	0x3
	.byte	0x5b
	.long	0x203
	.byte	0x9
	.byte	0x14
	.byte	0x3
	.byte	0x5d
	.long	0x276
	.byte	0xa
	.ascii "__name\0"
	.byte	0x3
	.byte	0x5e
	.long	0x276
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__mask\0"
	.byte	0x3
	.byte	0x5f
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x0
	.byte	0x6
	.long	0x125
	.long	0x286
	.byte	0x7
	.long	0x122
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.ascii "_RuneCharClass\0"
	.byte	0x3
	.byte	0x60
	.long	0x24b
	.byte	0xb
	.word	0xc5c
	.byte	0x3
	.byte	0x62
	.long	0x402
	.byte	0xa
	.ascii "__magic\0"
	.byte	0x3
	.byte	0x63
	.long	0x18a
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__encoding\0"
	.byte	0x3
	.byte	0x64
	.long	0x402
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "__sgetrune\0"
	.byte	0x3
	.byte	0x66
	.long	0x43d
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0xa
	.ascii "__sputrune\0"
	.byte	0x3
	.byte	0x67
	.long	0x468
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0xa
	.ascii "__invalid_rune\0"
	.byte	0x3
	.byte	0x68
	.long	0x171
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0xa
	.ascii "__runetype\0"
	.byte	0x3
	.byte	0x6a
	.long	0x46e
	.byte	0x2
	.byte	0x23
	.byte	0x34
	.byte	0xa
	.ascii "__maplower\0"
	.byte	0x3
	.byte	0x6b
	.long	0x47e
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x8
	.byte	0xa
	.ascii "__mapupper\0"
	.byte	0x3
	.byte	0x6c
	.long	0x47e
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x10
	.byte	0xa
	.ascii "__runetype_ext\0"
	.byte	0x3
	.byte	0x73
	.long	0x239
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x18
	.byte	0xa
	.ascii "__maplower_ext\0"
	.byte	0x3
	.byte	0x74
	.long	0x239
	.byte	0x3
	.byte	0x23
	.byte	0xbc,0x18
	.byte	0xa
	.ascii "__mapupper_ext\0"
	.byte	0x3
	.byte	0x75
	.long	0x239
	.byte	0x3
	.byte	0x23
	.byte	0xc4,0x18
	.byte	0xa
	.ascii "__variable\0"
	.byte	0x3
	.byte	0x77
	.long	0x188
	.byte	0x3
	.byte	0x23
	.byte	0xcc,0x18
	.byte	0xa
	.ascii "__variable_len\0"
	.byte	0x3
	.byte	0x78
	.long	0xc2
	.byte	0x3
	.byte	0x23
	.byte	0xd0,0x18
	.byte	0xa
	.ascii "__ncharclasses\0"
	.byte	0x3
	.byte	0x7d
	.long	0xc2
	.byte	0x3
	.byte	0x23
	.byte	0xd4,0x18
	.byte	0xa
	.ascii "__charclasses\0"
	.byte	0x3
	.byte	0x7e
	.long	0x48e
	.byte	0x3
	.byte	0x23
	.byte	0xd8,0x18
	.byte	0x0
	.byte	0x6
	.long	0x125
	.long	0x412
	.byte	0x7
	.long	0x122
	.byte	0x1f
	.byte	0x0
	.byte	0xc
	.byte	0x1
	.long	0x171
	.long	0x42c
	.byte	0xd
	.long	0x42c
	.byte	0xd
	.long	0x12d
	.byte	0xd
	.long	0x437
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x432
	.byte	0xe
	.long	0x125
	.byte	0x8
	.byte	0x4
	.long	0x42c
	.byte	0x8
	.byte	0x4
	.long	0x412
	.byte	0xc
	.byte	0x1
	.long	0xc2
	.long	0x462
	.byte	0xd
	.long	0x171
	.byte	0xd
	.long	0x19a
	.byte	0xd
	.long	0x12d
	.byte	0xd
	.long	0x462
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x19a
	.byte	0x8
	.byte	0x4
	.long	0x443
	.byte	0x6
	.long	0xc9
	.long	0x47e
	.byte	0x7
	.long	0x122
	.byte	0xff
	.byte	0x0
	.byte	0x6
	.long	0x171
	.long	0x48e
	.byte	0x7
	.long	0x122
	.byte	0xff
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x286
	.byte	0x3
	.ascii "_RuneLocale\0"
	.byte	0x3
	.byte	0x7f
	.long	0x29c
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.byte	0xf
	.byte	0x4
	.ascii "Class\0"
	.long	0x4c6
	.byte	0x10
	.ascii "objc_class\0"
	.byte	0x1
	.byte	0xf
	.byte	0x4
	.ascii "id\0"
	.long	0x4dc
	.byte	0x11
	.ascii "objc_object\0"
	.byte	0x4
	.byte	0xe
	.byte	0x0
	.long	0x4ff
	.byte	0xa
	.ascii "isa\0"
	.byte	0x4
	.byte	0x25
	.long	0x4ba
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x0
	.byte	0x3
	.ascii "SEL\0"
	.byte	0x4
	.byte	0x29
	.long	0x50a
	.byte	0x8
	.byte	0x4
	.long	0x510
	.byte	0x10
	.ascii "objc_selector\0"
	.byte	0x1
	.byte	0x3
	.ascii "BOOL\0"
	.byte	0x4
	.byte	0x2b
	.long	0x7f
	.byte	0x3
	.ascii "NSInteger\0"
	.byte	0x5
	.byte	0xe2
	.long	0xc2
	.byte	0x3
	.ascii "NSUInteger\0"
	.byte	0x5
	.byte	0xe3
	.long	0xdb
	.byte	0x12
	.ascii "NSObject\0"
	.byte	0x10
	.byte	0x4
	.byte	0x6
	.byte	0x43
	.long	0x571
	.byte	0x13
	.ascii "isa\0"
	.byte	0x6
	.byte	0x42
	.long	0x4ba
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x4d3
	.byte	0x12
	.ascii "NSArray\0"
	.byte	0x10
	.byte	0x4
	.byte	0x7
	.byte	0x7
	.long	0x592
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x12
	.ascii "NSMutableArray\0"
	.byte	0x10
	.byte	0x4
	.byte	0x8
	.byte	0x72
	.long	0x5b4
	.byte	0x14
	.long	0x577
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x3
	.ascii "unichar\0"
	.byte	0x9
	.byte	0x5
	.long	0xac
	.byte	0x12
	.ascii "NSString\0"
	.byte	0x10
	.byte	0x4
	.byte	0x5
	.byte	0xec
	.long	0x5df
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x12
	.ascii "NSMutableDictionary\0"
	.byte	0x10
	.byte	0x4
	.byte	0xa
	.byte	0x8
	.long	0x606
	.byte	0x14
	.long	0x60c
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x5df
	.byte	0x12
	.ascii "NSDictionary\0"
	.byte	0x10
	.byte	0x4
	.byte	0xb
	.byte	0x7
	.long	0x62c
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x5c3
	.byte	0x8
	.byte	0x4
	.long	0x577
	.byte	0x3
	.ascii "CGFloat\0"
	.byte	0xc
	.byte	0x59
	.long	0x4a7
	.byte	0x15
	.set L$set$304,LASF0-Lsection__debug_str
	.long L$set$304
	.byte	0xd
	.byte	0x8
	.long	0x652
	.byte	0x16
	.set L$set$305,LASF0-Lsection__debug_str
	.long L$set$305
	.byte	0x18
	.byte	0xd
	.byte	0x8
	.long	0x6a9
	.byte	0xa
	.ascii "a\0"
	.byte	0xd
	.byte	0xe
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "b\0"
	.byte	0xd
	.byte	0xe
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "c\0"
	.byte	0xd
	.byte	0xe
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "d\0"
	.byte	0xd
	.byte	0xe
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0xa
	.ascii "tx\0"
	.byte	0xd
	.byte	0xf
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0xa
	.ascii "ty\0"
	.byte	0xd
	.byte	0xf
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x0
	.byte	0x11
	.ascii "CGPoint\0"
	.byte	0x8
	.byte	0xf
	.byte	0xd
	.long	0x6d2
	.byte	0xa
	.ascii "x\0"
	.byte	0xf
	.byte	0xe
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "y\0"
	.byte	0xf
	.byte	0xf
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "CGPoint\0"
	.byte	0xf
	.byte	0x11
	.long	0x6a9
	.byte	0x11
	.ascii "CGSize\0"
	.byte	0x8
	.byte	0xf
	.byte	0x15
	.long	0x712
	.byte	0xa
	.ascii "width\0"
	.byte	0xf
	.byte	0x16
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "height\0"
	.byte	0xf
	.byte	0x17
	.long	0x638
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "CGSize\0"
	.byte	0xf
	.byte	0x19
	.long	0x6e1
	.byte	0x11
	.ascii "CGRect\0"
	.byte	0x10
	.byte	0xf
	.byte	0x1d
	.long	0x750
	.byte	0xa
	.ascii "origin\0"
	.byte	0xf
	.byte	0x1e
	.long	0x6d2
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "size\0"
	.byte	0xf
	.byte	0x1f
	.long	0x712
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x0
	.byte	0x3
	.ascii "CGRect\0"
	.byte	0xf
	.byte	0x21
	.long	0x720
	.byte	0x8
	.byte	0x4
	.long	0x592
	.byte	0x3
	.ascii "GLenum\0"
	.byte	0x10
	.byte	0x2d
	.long	0xdb
	.byte	0x3
	.ascii "GLint\0"
	.byte	0x10
	.byte	0x32
	.long	0xc2
	.byte	0x3
	.ascii "GLubyte\0"
	.byte	0x10
	.byte	0x34
	.long	0x8e
	.byte	0x3
	.ascii "GLushort\0"
	.byte	0x10
	.byte	0x35
	.long	0xac
	.byte	0x3
	.ascii "GLuint\0"
	.byte	0x10
	.byte	0x36
	.long	0xdb
	.byte	0x3
	.ascii "GLfloat\0"
	.byte	0x10
	.byte	0x37
	.long	0x4a7
	.byte	0x11
	.ascii "_ccColor3B\0"
	.byte	0x3
	.byte	0x11
	.byte	0x2c
	.long	0x7f3
	.byte	0xa
	.ascii "r\0"
	.byte	0x11
	.byte	0x2d
	.long	0x77f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "g\0"
	.byte	0x11
	.byte	0x2e
	.long	0x77f
	.byte	0x2
	.byte	0x23
	.byte	0x1
	.byte	0xa
	.ascii "b\0"
	.byte	0x11
	.byte	0x2f
	.long	0x77f
	.byte	0x2
	.byte	0x23
	.byte	0x2
	.byte	0x0
	.byte	0x3
	.ascii "ccColor3B\0"
	.byte	0x11
	.byte	0x30
	.long	0x7bb
	.byte	0x11
	.ascii "_ccColor4B\0"
	.byte	0x4
	.byte	0x11
	.byte	0x51
	.long	0x848
	.byte	0xa
	.ascii "r\0"
	.byte	0x11
	.byte	0x52
	.long	0x77f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "g\0"
	.byte	0x11
	.byte	0x53
	.long	0x77f
	.byte	0x2
	.byte	0x23
	.byte	0x1
	.byte	0xa
	.ascii "b\0"
	.byte	0x11
	.byte	0x54
	.long	0x77f
	.byte	0x2
	.byte	0x23
	.byte	0x2
	.byte	0xa
	.ascii "a\0"
	.byte	0x11
	.byte	0x55
	.long	0x77f
	.byte	0x2
	.byte	0x23
	.byte	0x3
	.byte	0x0
	.byte	0x3
	.ascii "ccColor4B\0"
	.byte	0x11
	.byte	0x56
	.long	0x804
	.byte	0x11
	.ascii "_ccVertex3F\0"
	.byte	0xc
	.byte	0x11
	.byte	0x8f
	.long	0x892
	.byte	0xa
	.ascii "x\0"
	.byte	0x11
	.byte	0x90
	.long	0x7ac
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "y\0"
	.byte	0x11
	.byte	0x91
	.long	0x7ac
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "z\0"
	.byte	0x11
	.byte	0x92
	.long	0x7ac
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x0
	.byte	0x3
	.ascii "ccVertex3F\0"
	.byte	0x11
	.byte	0x93
	.long	0x859
	.byte	0x11
	.ascii "_ccTex2F\0"
	.byte	0x8
	.byte	0x11
	.byte	0x98
	.long	0x8ce
	.byte	0xa
	.ascii "u\0"
	.byte	0x11
	.byte	0x99
	.long	0x7ac
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "v\0"
	.byte	0x11
	.byte	0x9a
	.long	0x7ac
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "ccTex2F\0"
	.byte	0x11
	.byte	0x9b
	.long	0x8a4
	.byte	0x11
	.ascii "_ccGridSize\0"
	.byte	0x8
	.byte	0x11
	.byte	0xb9
	.long	0x90a
	.byte	0xa
	.ascii "x\0"
	.byte	0x11
	.byte	0xba
	.long	0x52c
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "y\0"
	.byte	0x11
	.byte	0xbb
	.long	0x52c
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "ccGridSize\0"
	.byte	0x11
	.byte	0xbc
	.long	0x8dd
	.byte	0x11
	.ascii "_ccV3F_C4B_T2F\0"
	.byte	0x18
	.byte	0x11
	.byte	0xd3
	.long	0x96c
	.byte	0xa
	.ascii "vertices\0"
	.byte	0x11
	.byte	0xd5
	.long	0x892
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "colors\0"
	.byte	0x11
	.byte	0xd9
	.long	0x848
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0xa
	.ascii "texCoords\0"
	.byte	0x11
	.byte	0xdd
	.long	0x8ce
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x0
	.byte	0x3
	.ascii "ccV3F_C4B_T2F\0"
	.byte	0x11
	.byte	0xde
	.long	0x91c
	.byte	0x11
	.ascii "_ccV3F_C4B_T2F_Quad\0"
	.byte	0x60
	.byte	0x11
	.byte	0xe2
	.long	0x9d2
	.byte	0xa
	.ascii "tl\0"
	.byte	0x11
	.byte	0xe4
	.long	0x96c
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "bl\0"
	.byte	0x11
	.byte	0xe6
	.long	0x96c
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0xa
	.ascii "tr\0"
	.byte	0x11
	.byte	0xe8
	.long	0x96c
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0xa
	.ascii "br\0"
	.byte	0x11
	.byte	0xea
	.long	0x96c
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x0
	.byte	0x3
	.ascii "ccV3F_C4B_T2F_Quad\0"
	.byte	0x11
	.byte	0xeb
	.long	0x981
	.byte	0x11
	.ascii "_ccBlendFunc\0"
	.byte	0x8
	.byte	0x11
	.byte	0xfc
	.long	0xa1f
	.byte	0xa
	.ascii "src\0"
	.byte	0x11
	.byte	0xfe
	.long	0x764
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x17
	.ascii "dst\0"
	.byte	0x11
	.word	0x100
	.long	0x764
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x18
	.ascii "ccBlendFunc\0"
	.byte	0x11
	.word	0x101
	.long	0x9ec
	.byte	0x12
	.ascii "CCNode\0"
	.byte	0x10
	.byte	0xdc
	.byte	0x12
	.byte	0x8d
	.long	0xcbc
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "rotation_\0"
	.byte	0x13
	.byte	0x64
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "scaleX_\0"
	.byte	0x13
	.byte	0x67
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "scaleY_\0"
	.byte	0x13
	.byte	0x67
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x13
	.ascii "position_\0"
	.byte	0x13
	.byte	0x6a
	.long	0x6d2
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "positionInPixels_\0"
	.byte	0x13
	.byte	0x6b
	.long	0x6d2
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "visible_\0"
	.byte	0x13
	.byte	0x6e
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "anchorPointInPixels_\0"
	.byte	0x13
	.byte	0x71
	.long	0x6d2
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x13
	.ascii "anchorPoint_\0"
	.byte	0x13
	.byte	0x73
	.long	0x6d2
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0x2
	.byte	0x13
	.ascii "isRelativeAnchorPoint_\0"
	.byte	0x13
	.byte	0x77
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0x34
	.byte	0x2
	.byte	0x13
	.ascii "contentSize_\0"
	.byte	0x13
	.byte	0x7a
	.long	0x712
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x2
	.byte	0x13
	.ascii "contentSizeInPixels_\0"
	.byte	0x13
	.byte	0x7b
	.long	0x712
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0x2
	.byte	0x13
	.ascii "transform_\0"
	.byte	0x13
	.byte	0x7e
	.long	0x647
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x2
	.byte	0x13
	.ascii "inverse_\0"
	.byte	0x13
	.byte	0x7e
	.long	0x647
	.byte	0x2
	.byte	0x23
	.byte	0x60
	.byte	0x2
	.byte	0x13
	.ascii "transformGL_\0"
	.byte	0x13
	.byte	0x80
	.long	0xfe8
	.byte	0x2
	.byte	0x23
	.byte	0x78
	.byte	0x2
	.byte	0x13
	.ascii "vertexZ_\0"
	.byte	0x13
	.byte	0x84
	.long	0x4a7
	.byte	0x3
	.byte	0x23
	.byte	0xb8,0x1
	.byte	0x2
	.byte	0x13
	.ascii "camera_\0"
	.byte	0x13
	.byte	0x87
	.long	0x10c5
	.byte	0x3
	.byte	0x23
	.byte	0xbc,0x1
	.byte	0x2
	.byte	0x13
	.ascii "grid_\0"
	.byte	0x13
	.byte	0x8a
	.long	0x1178
	.byte	0x3
	.byte	0x23
	.byte	0xc0,0x1
	.byte	0x2
	.byte	0x13
	.ascii "zOrder_\0"
	.byte	0x13
	.byte	0x8d
	.long	0x52c
	.byte	0x3
	.byte	0x23
	.byte	0xc4,0x1
	.byte	0x2
	.byte	0x13
	.ascii "children_\0"
	.byte	0x13
	.byte	0x90
	.long	0x117e
	.byte	0x3
	.byte	0x23
	.byte	0xc8,0x1
	.byte	0x2
	.byte	0x13
	.ascii "parent_\0"
	.byte	0x13
	.byte	0x93
	.long	0xcbc
	.byte	0x3
	.byte	0x23
	.byte	0xcc,0x1
	.byte	0x2
	.byte	0x13
	.ascii "tag_\0"
	.byte	0x13
	.byte	0x96
	.long	0x52c
	.byte	0x3
	.byte	0x23
	.byte	0xd0,0x1
	.byte	0x2
	.byte	0x13
	.ascii "userData_\0"
	.byte	0x13
	.byte	0x99
	.long	0x188
	.byte	0x3
	.byte	0x23
	.byte	0xd4,0x1
	.byte	0x2
	.byte	0x13
	.ascii "isRunning_\0"
	.byte	0x13
	.byte	0x9c
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xd8,0x1
	.byte	0x2
	.byte	0x19
	.ascii "isTransformDirty_\0"
	.byte	0x13
	.byte	0x9f
	.long	0x520
	.byte	0x1
	.byte	0x1
	.byte	0x7
	.byte	0x3
	.byte	0x23
	.byte	0xd9,0x1
	.byte	0x2
	.byte	0x19
	.ascii "isInverseDirty_\0"
	.byte	0x13
	.byte	0xa0
	.long	0x520
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.byte	0x3
	.byte	0x23
	.byte	0xd9,0x1
	.byte	0x2
	.byte	0x19
	.ascii "isTransformGLDirty_\0"
	.byte	0x13
	.byte	0xa2
	.long	0x520
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.byte	0x23
	.byte	0xd9,0x1
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xa33
	.byte	0x11
	.ascii "ccArray\0"
	.byte	0xc
	.byte	0x14
	.byte	0x37
	.long	0xcfd
	.byte	0xa
	.ascii "num\0"
	.byte	0x14
	.byte	0x38
	.long	0x53d
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "max\0"
	.byte	0x14
	.byte	0x38
	.long	0x53d
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "arr\0"
	.byte	0x14
	.byte	0x39
	.long	0x571
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x0
	.byte	0x3
	.ascii "ccArray\0"
	.byte	0x14
	.byte	0x3a
	.long	0xcc2
	.byte	0x1a
	.byte	0x4
	.byte	0x15
	.byte	0x4f
	.long	0xedd
	.byte	0x1b
	.ascii "kCCTexture2DPixelFormat_Automatic\0"
	.byte	0x0
	.byte	0x1b
	.ascii "kCCTexture2DPixelFormat_RGBA8888\0"
	.byte	0x1
	.byte	0x1b
	.ascii "kCCTexture2DPixelFormat_RGB565\0"
	.byte	0x2
	.byte	0x1b
	.ascii "kCCTexture2DPixelFormat_A8\0"
	.byte	0x3
	.byte	0x1b
	.ascii "kCCTexture2DPixelFormat_RGBA4444\0"
	.byte	0x4
	.byte	0x1b
	.ascii "kCCTexture2DPixelFormat_RGB5A1\0"
	.byte	0x5
	.byte	0x1b
	.ascii "kCCTexture2DPixelFormat_Default\0"
	.byte	0x1
	.byte	0x1b
	.ascii "kTexture2DPixelFormat_Automatic\0"
	.byte	0x0
	.byte	0x1b
	.ascii "kTexture2DPixelFormat_RGBA8888\0"
	.byte	0x1
	.byte	0x1b
	.ascii "kTexture2DPixelFormat_RGB565\0"
	.byte	0x2
	.byte	0x1b
	.ascii "kTexture2DPixelFormat_A8\0"
	.byte	0x3
	.byte	0x1b
	.ascii "kTexture2DPixelFormat_RGBA4444\0"
	.byte	0x4
	.byte	0x1b
	.ascii "kTexture2DPixelFormat_RGB5A1\0"
	.byte	0x5
	.byte	0x1b
	.ascii "kTexture2DPixelFormat_Default\0"
	.byte	0x1
	.byte	0x0
	.byte	0x3
	.ascii "CCTexture2DPixelFormat\0"
	.byte	0x15
	.byte	0x68
	.long	0xd0c
	.byte	0x12
	.ascii "CCTexture2D\0"
	.byte	0x10
	.byte	0x28
	.byte	0x15
	.byte	0x7c
	.long	0xfb8
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "name_\0"
	.byte	0x15
	.byte	0x74
	.long	0x79e
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "size_\0"
	.byte	0x15
	.byte	0x75
	.long	0x712
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "width_\0"
	.byte	0x15
	.byte	0x76
	.long	0x53d
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "height_\0"
	.byte	0x15
	.byte	0x77
	.long	0x53d
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "format_\0"
	.byte	0x15
	.byte	0x78
	.long	0xedd
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "maxS_\0"
	.byte	0x15
	.byte	0x79
	.long	0x7ac
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.ascii "maxT_\0"
	.byte	0x15
	.byte	0x7a
	.long	0x7ac
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "hasPremultipliedAlpha_\0"
	.byte	0x15
	.byte	0x7b
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x0
	.byte	0x12
	.ascii "CCArray\0"
	.byte	0x10
	.byte	0x8
	.byte	0x16
	.byte	0x31
	.long	0xfe2
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0xa
	.ascii "data\0"
	.byte	0x16
	.byte	0x30
	.long	0xfe2
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xcfd
	.byte	0x6
	.long	0x7ac
	.long	0xff8
	.byte	0x7
	.long	0x122
	.byte	0xf
	.byte	0x0
	.byte	0x12
	.ascii "CCCamera\0"
	.byte	0x10
	.byte	0x2c
	.byte	0x13
	.byte	0x28
	.long	0x10c5
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "eyeX_\0"
	.byte	0x17
	.byte	0x36
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "eyeY_\0"
	.byte	0x17
	.byte	0x37
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "eyeZ_\0"
	.byte	0x17
	.byte	0x38
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x13
	.ascii "centerX_\0"
	.byte	0x17
	.byte	0x3a
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "centerY_\0"
	.byte	0x17
	.byte	0x3b
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "centerZ_\0"
	.byte	0x17
	.byte	0x3c
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "upX_\0"
	.byte	0x17
	.byte	0x3e
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.ascii "upY_\0"
	.byte	0x17
	.byte	0x3f
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "upZ_\0"
	.byte	0x17
	.byte	0x40
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x13
	.ascii "dirty_\0"
	.byte	0x17
	.byte	0x42
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xff8
	.byte	0x12
	.ascii "CCGridBase\0"
	.byte	0x10
	.byte	0x28
	.byte	0x13
	.byte	0x29
	.long	0x1178
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "active_\0"
	.byte	0x18
	.byte	0x28
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "reuseGrid_\0"
	.byte	0x18
	.byte	0x29
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "gridSize_\0"
	.byte	0x18
	.byte	0x2a
	.long	0x90a
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x1c
	.set L$set$306,LASF1-Lsection__debug_str
	.long L$set$306
	.byte	0x18
	.byte	0x2b
	.long	0x1184
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "step_\0"
	.byte	0x18
	.byte	0x2c
	.long	0x6d2
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "grabber_\0"
	.byte	0x18
	.byte	0x2d
	.long	0x11c8
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "isTextureFlipped_\0"
	.byte	0x18
	.byte	0x2e
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x10cb
	.byte	0x8
	.byte	0x4
	.long	0xfb8
	.byte	0x8
	.byte	0x4
	.long	0xefb
	.byte	0x12
	.ascii "CCGrabber\0"
	.byte	0x10
	.byte	0xc
	.byte	0x18
	.byte	0x22
	.long	0x11c8
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "fbo\0"
	.byte	0x19
	.byte	0x23
	.long	0x79e
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "oldFBO\0"
	.byte	0x19
	.byte	0x24
	.long	0x772
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x118a
	.byte	0x8
	.byte	0x4
	.long	0x78e
	.byte	0x12
	.ascii "CCTextureAtlas\0"
	.byte	0x10
	.byte	0x20
	.byte	0x1a
	.byte	0x34
	.long	0x126e
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "totalQuads_\0"
	.byte	0x1a
	.byte	0x2c
	.long	0x53d
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "capacity_\0"
	.byte	0x1a
	.byte	0x2d
	.long	0x53d
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "quads_\0"
	.byte	0x1a
	.byte	0x2e
	.long	0x126e
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x13
	.ascii "indices_\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x11ce
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x1c
	.set L$set$307,LASF1-Lsection__debug_str
	.long L$set$307
	.byte	0x1a
	.byte	0x30
	.long	0x1184
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "buffersVBO_\0"
	.byte	0x1a
	.byte	0x32
	.long	0x1274
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x9d2
	.byte	0x6
	.long	0x79e
	.long	0x1284
	.byte	0x7
	.long	0x122
	.byte	0x1
	.byte	0x0
	.byte	0x1a
	.byte	0x4
	.byte	0x1b
	.byte	0x32
	.long	0x1318
	.byte	0x1b
	.ascii "CC_HONOR_PARENT_TRANSFORM_TRANSLATE\0"
	.byte	0x1
	.byte	0x1b
	.ascii "CC_HONOR_PARENT_TRANSFORM_ROTATE\0"
	.byte	0x2
	.byte	0x1b
	.ascii "CC_HONOR_PARENT_TRANSFORM_SCALE\0"
	.byte	0x4
	.byte	0x1b
	.ascii "CC_HONOR_PARENT_TRANSFORM_ALL\0"
	.byte	0x7
	.byte	0x0
	.byte	0x3
	.ascii "ccHonorParentTransform\0"
	.byte	0x1b
	.byte	0x3d
	.long	0x1284
	.byte	0x1d
	.ascii "CCSprite\0"
	.byte	0x10
	.word	0x1a8
	.byte	0x1b
	.byte	0x8d
	.long	0x159a
	.byte	0x14
	.long	0xa33
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x1c
	.set L$set$308,LASF2-Lsection__debug_str
	.long L$set$308
	.byte	0x1b
	.byte	0x5b
	.long	0x159a
	.byte	0x3
	.byte	0x23
	.byte	0xdc,0x1
	.byte	0x2
	.byte	0x13
	.ascii "atlasIndex_\0"
	.byte	0x1b
	.byte	0x5c
	.long	0x53d
	.byte	0x3
	.byte	0x23
	.byte	0xe0,0x1
	.byte	0x2
	.byte	0x13
	.ascii "batchNode_\0"
	.byte	0x1b
	.byte	0x5d
	.long	0x15fe
	.byte	0x3
	.byte	0x23
	.byte	0xe4,0x1
	.byte	0x2
	.byte	0x13
	.ascii "honorParentTransform_\0"
	.byte	0x1b
	.byte	0x5e
	.long	0x1318
	.byte	0x3
	.byte	0x23
	.byte	0xe8,0x1
	.byte	0x2
	.byte	0x13
	.ascii "dirty_\0"
	.byte	0x1b
	.byte	0x5f
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xec,0x1
	.byte	0x2
	.byte	0x13
	.ascii "recursiveDirty_\0"
	.byte	0x1b
	.byte	0x60
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xed,0x1
	.byte	0x2
	.byte	0x13
	.ascii "hasChildren_\0"
	.byte	0x1b
	.byte	0x61
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xee,0x1
	.byte	0x2
	.byte	0x1c
	.set L$set$309,LASF3-Lsection__debug_str
	.long L$set$309
	.byte	0x1b
	.byte	0x66
	.long	0xa1f
	.byte	0x3
	.byte	0x23
	.byte	0xf0,0x1
	.byte	0x2
	.byte	0x1c
	.set L$set$310,LASF1-Lsection__debug_str
	.long L$set$310
	.byte	0x1b
	.byte	0x67
	.long	0x1184
	.byte	0x3
	.byte	0x23
	.byte	0xf8,0x1
	.byte	0x2
	.byte	0x13
	.ascii "usesBatchNode_\0"
	.byte	0x1b
	.byte	0x6e
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xfc,0x1
	.byte	0x2
	.byte	0x13
	.ascii "rect_\0"
	.byte	0x1b
	.byte	0x71
	.long	0x750
	.byte	0x3
	.byte	0x23
	.byte	0x80,0x2
	.byte	0x2
	.byte	0x13
	.ascii "rectInPixels_\0"
	.byte	0x1b
	.byte	0x72
	.long	0x750
	.byte	0x3
	.byte	0x23
	.byte	0x90,0x2
	.byte	0x2
	.byte	0x13
	.ascii "rectRotated_\0"
	.byte	0x1b
	.byte	0x73
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xa0,0x2
	.byte	0x2
	.byte	0x13
	.ascii "offsetPositionInPixels_\0"
	.byte	0x1b
	.byte	0x76
	.long	0x6d2
	.byte	0x3
	.byte	0x23
	.byte	0xa4,0x2
	.byte	0x2
	.byte	0x13
	.ascii "unflippedOffsetPositionFromCenter_\0"
	.byte	0x1b
	.byte	0x77
	.long	0x6d2
	.byte	0x3
	.byte	0x23
	.byte	0xac,0x2
	.byte	0x2
	.byte	0x13
	.ascii "quad_\0"
	.byte	0x1b
	.byte	0x7a
	.long	0x9d2
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x2
	.byte	0x2
	.byte	0x13
	.ascii "opacity_\0"
	.byte	0x1b
	.byte	0x7d
	.long	0x77f
	.byte	0x3
	.byte	0x23
	.byte	0x94,0x3
	.byte	0x2
	.byte	0x13
	.ascii "color_\0"
	.byte	0x1b
	.byte	0x7e
	.long	0x7f3
	.byte	0x3
	.byte	0x23
	.byte	0x95,0x3
	.byte	0x2
	.byte	0x13
	.ascii "colorUnmodified_\0"
	.byte	0x1b
	.byte	0x7f
	.long	0x7f3
	.byte	0x3
	.byte	0x23
	.byte	0x98,0x3
	.byte	0x2
	.byte	0x13
	.ascii "opacityModifyRGB_\0"
	.byte	0x1b
	.byte	0x80
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0x9b,0x3
	.byte	0x2
	.byte	0x13
	.ascii "flipX_\0"
	.byte	0x1b
	.byte	0x83
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0x9c,0x3
	.byte	0x2
	.byte	0x13
	.ascii "flipY_\0"
	.byte	0x1b
	.byte	0x84
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0x9d,0x3
	.byte	0x2
	.byte	0x13
	.ascii "animations_\0"
	.byte	0x1b
	.byte	0x88
	.long	0x606
	.byte	0x3
	.byte	0x23
	.byte	0xa0,0x3
	.byte	0x2
	.byte	0xa
	.ascii "updateMethod\0"
	.byte	0x1b
	.byte	0x8c
	.long	0x1615
	.byte	0x3
	.byte	0x23
	.byte	0xa4,0x3
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x11d4
	.byte	0x12
	.ascii "CCSpriteBatchNode\0"
	.byte	0x10
	.byte	0xec
	.byte	0x1b
	.byte	0x1f
	.long	0x15fe
	.byte	0x14
	.long	0xa33
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x1c
	.set L$set$311,LASF2-Lsection__debug_str
	.long L$set$311
	.byte	0x1c
	.byte	0x36
	.long	0x159a
	.byte	0x3
	.byte	0x23
	.byte	0xdc,0x1
	.byte	0x2
	.byte	0x1c
	.set L$set$312,LASF3-Lsection__debug_str
	.long L$set$312
	.byte	0x1c
	.byte	0x37
	.long	0xa1f
	.byte	0x3
	.byte	0x23
	.byte	0xe0,0x1
	.byte	0x2
	.byte	0x13
	.ascii "descendants_\0"
	.byte	0x1c
	.byte	0x3a
	.long	0x117e
	.byte	0x3
	.byte	0x23
	.byte	0xe8,0x1
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x15a0
	.byte	0x1e
	.byte	0x1
	.long	0x1615
	.byte	0xd
	.long	0x4d3
	.byte	0xd
	.long	0x4ff
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1604
	.byte	0x8
	.byte	0x4
	.long	0x1336
	.byte	0x12
	.ascii "CCLayer\0"
	.byte	0x10
	.byte	0xdc
	.byte	0x1d
	.byte	0x35
	.long	0x167c
	.byte	0x14
	.long	0xa33
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "isTouchEnabled_\0"
	.byte	0x1d
	.byte	0x33
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xda,0x1
	.byte	0x2
	.byte	0x13
	.ascii "isAccelerometerEnabled_\0"
	.byte	0x1d
	.byte	0x34
	.long	0x520
	.byte	0x3
	.byte	0x23
	.byte	0xdb,0x1
	.byte	0x2
	.byte	0x0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.byte	0x12
	.ascii "Symbol\0"
	.byte	0x10
	.byte	0x10
	.byte	0x1e
	.byte	0x11
	.long	0x16d8
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "character\0"
	.byte	0x1e
	.byte	0xe
	.long	0x5b4
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "index\0"
	.byte	0x1e
	.byte	0xf
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "enabled\0"
	.byte	0x1e
	.byte	0x10
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x0
	.byte	0x1a
	.byte	0x4
	.byte	0x1f
	.byte	0x16
	.long	0x1704
	.byte	0x1b
	.ascii "RUNING\0"
	.byte	0x0
	.byte	0x1b
	.ascii "STOPPED\0"
	.byte	0x1
	.byte	0x1b
	.ascii "PAUSED\0"
	.byte	0x2
	.byte	0x1b
	.ascii "FREE\0"
	.byte	0x3
	.byte	0x0
	.byte	0x3
	.ascii "TrackStatus\0"
	.byte	0x1f
	.byte	0x1b
	.long	0x16d8
	.byte	0x12
	.ascii "Track\0"
	.byte	0x10
	.byte	0x50
	.byte	0x1f
	.byte	0x36
	.long	0x18b5
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "status\0"
	.byte	0x1f
	.byte	0x1f
	.long	0x1704
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "position\0"
	.byte	0x1f
	.byte	0x20
	.long	0x6d2
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "sprites\0"
	.byte	0x1f
	.byte	0x21
	.long	0x75e
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "symbols\0"
	.byte	0x1f
	.byte	0x22
	.long	0x75e
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "speed\0"
	.byte	0x1f
	.byte	0x23
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "pausedTime\0"
	.byte	0x1f
	.byte	0x24
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.ascii "selectedSprite\0"
	.byte	0x1f
	.byte	0x25
	.long	0x161b
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "layer\0"
	.byte	0x1f
	.byte	0x26
	.long	0x18b5
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x13
	.ascii "rows\0"
	.byte	0x1f
	.byte	0x27
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x2
	.byte	0x13
	.ascii "accelerometerSensibility\0"
	.byte	0x1f
	.byte	0x28
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0x2
	.byte	0x13
	.ascii "disacceleration\0"
	.byte	0x1f
	.byte	0x29
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x2
	.byte	0x13
	.ascii "maxSpeed\0"
	.byte	0x1f
	.byte	0x2a
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x34
	.byte	0x2
	.byte	0x13
	.ascii "trackWidth\0"
	.byte	0x1f
	.byte	0x2b
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x2
	.byte	0x13
	.ascii "index\0"
	.byte	0x1f
	.byte	0x2c
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x3c
	.byte	0x2
	.byte	0x13
	.ascii "yOffset\0"
	.byte	0x1f
	.byte	0x30
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0x3
	.byte	0x13
	.ascii "pausedTimeInterval\0"
	.byte	0x1f
	.byte	0x31
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x44
	.byte	0x3
	.byte	0x13
	.ascii "acumSpeed\0"
	.byte	0x1f
	.byte	0x32
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x3
	.byte	0x13
	.ascii "runDistance\0"
	.byte	0x1f
	.byte	0x33
	.long	0x4a7
	.byte	0x2
	.byte	0x23
	.byte	0x4c
	.byte	0x3
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1621
	.byte	0x12
	.ascii "HitGenerator\0"
	.byte	0x10
	.byte	0x5c
	.byte	0x20
	.byte	0x28
	.long	0x1abc
	.byte	0x14
	.long	0x54f
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "jokerInterval\0"
	.byte	0x20
	.byte	0xf
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "jokerHitCount\0"
	.byte	0x20
	.byte	0x10
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "timeUpIndex\0"
	.byte	0x20
	.byte	0x11
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x13
	.ascii "liveInterval\0"
	.byte	0x20
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "liveHitCount\0"
	.byte	0x20
	.byte	0x14
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "maxTries\0"
	.byte	0x20
	.byte	0x15
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "minHits\0"
	.byte	0x20
	.byte	0x16
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.ascii "rows\0"
	.byte	0x20
	.byte	0x17
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "trioStairRatio\0"
	.byte	0x20
	.byte	0x18
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x13
	.ascii "timeRewards\0"
	.byte	0x20
	.byte	0x19
	.long	0x632
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x2
	.byte	0x13
	.ascii "generationIndex\0"
	.byte	0x20
	.byte	0x1c
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0x3
	.byte	0x13
	.ascii "hitString\0"
	.byte	0x20
	.byte	0x1d
	.long	0x62c
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x3
	.byte	0x13
	.ascii "isHit\0"
	.byte	0x20
	.byte	0x1e
	.long	0x520
	.byte	0x2
	.byte	0x23
	.byte	0x34
	.byte	0x3
	.byte	0x13
	.ascii "jokerHitStatus\0"
	.byte	0x20
	.byte	0x1f
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x3
	.byte	0x13
	.ascii "liveHitStatus\0"
	.byte	0x20
	.byte	0x20
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x3c
	.byte	0x3
	.byte	0x13
	.ascii "typeHit\0"
	.byte	0x20
	.byte	0x21
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0x3
	.byte	0x13
	.ascii "jokerIndex\0"
	.byte	0x20
	.byte	0x22
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x44
	.byte	0x3
	.byte	0x13
	.ascii "liveIndex\0"
	.byte	0x20
	.byte	0x23
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x3
	.byte	0x13
	.ascii "timeRewardIndex\0"
	.byte	0x20
	.byte	0x24
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x4c
	.byte	0x3
	.byte	0x13
	.ascii "tracks\0"
	.byte	0x20
	.byte	0x25
	.long	0x632
	.byte	0x2
	.byte	0x23
	.byte	0x50
	.byte	0x3
	.byte	0x13
	.ascii "hits\0"
	.byte	0x20
	.byte	0x26
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x54
	.byte	0x3
	.byte	0x13
	.ascii "tries\0"
	.byte	0x20
	.byte	0x27
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x58
	.byte	0x3
	.byte	0x0
	.byte	0x1a
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.long	0x1aea
	.byte	0x1b
	.ascii "GENERATED\0"
	.byte	0x0
	.byte	0x1b
	.ascii "SCHEDULED\0"
	.byte	0x1
	.byte	0x1b
	.ascii "GENERATING\0"
	.byte	0x2
	.byte	0x0
	.byte	0x1f
	.set L$set$313,LASF9-Lsection__debug_str
	.long L$set$313
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.long	0x4d3
	.long	LFB211
	.long	LFE211
	.set L$set$314,LLST0-Lsection__debug_loc
	.long L$set$314
	.long	0x1b5a
	.byte	0x20
	.set L$set$315,LASF4-Lsection__debug_str
	.long L$set$315
	.byte	0x1
	.byte	0x16
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$316,LASF5-Lsection__debug_str
	.long L$set$316
	.byte	0x1
	.byte	0x16
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x21
	.ascii "tracksArray\0"
	.byte	0x1
	.byte	0x16
	.long	0x632
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x21
	.ascii "r\0"
	.byte	0x1
	.byte	0x16
	.long	0x4d3
	.byte	0x2
	.byte	0x91
	.byte	0xc
	.byte	0x22
	.ascii "objc_super\0"
	.byte	0x1
	.byte	0x17
	.long	0x1b60
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x18bb
	.byte	0x11
	.ascii "_objc_super\0"
	.byte	0x8
	.byte	0xe
	.byte	0x0
	.long	0x1b91
	.byte	0x23
	.set L$set$317,LASF4-Lsection__debug_str
	.long L$set$317
	.byte	0xe
	.byte	0x0
	.long	0x4d3
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "cls\0"
	.byte	0xe
	.byte	0x0
	.long	0x4ba
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$318,LASF6-Lsection__debug_str
	.long L$set$318
	.byte	0x1
	.byte	0x25
	.byte	0x1
	.long	LFB212
	.long	LFE212
	.set L$set$319,LLST1-Lsection__debug_loc
	.long L$set$319
	.long	0x1be9
	.byte	0x20
	.set L$set$320,LASF4-Lsection__debug_str
	.long L$set$320
	.byte	0x1
	.byte	0x25
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$321,LASF5-Lsection__debug_str
	.long L$set$321
	.byte	0x1
	.byte	0x25
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x21
	.ascii "quantity\0"
	.byte	0x1
	.byte	0x25
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x22
	.ascii "start\0"
	.byte	0x1
	.byte	0x26
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x0
	.byte	0x24
	.set L$set$322,LASF7-Lsection__debug_str
	.long L$set$322
	.byte	0x1
	.byte	0x2d
	.byte	0x1
	.long	LFB213
	.long	LFE213
	.set L$set$323,LLST2-Lsection__debug_loc
	.long L$set$323
	.long	0x1cfe
	.byte	0x20
	.set L$set$324,LASF4-Lsection__debug_str
	.long L$set$324
	.byte	0x1
	.byte	0x2d
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$325,LASF5-Lsection__debug_str
	.long L$set$325
	.byte	0x1
	.byte	0x2d
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x22
	.ascii "firstTrack\0"
	.byte	0x1
	.byte	0x2e
	.long	0x1cfe
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x22
	.ascii "x\0"
	.byte	0x1
	.byte	0x68
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x22
	.ascii "y\0"
	.byte	0x1
	.byte	0x6a
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x22
	.ascii "pos\0"
	.byte	0x1
	.byte	0x6b
	.long	0x1d04
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x25
	.long	LBB2
	.long	LBE2
	.long	0x1c76
	.byte	0x22
	.ascii "symb\0"
	.byte	0x1
	.byte	0x59
	.long	0x1d14
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x0
	.byte	0x25
	.long	LBB3
	.long	LBE3
	.long	0x1ccb
	.byte	0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0x6e
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x26
	.long	LBB4
	.long	LBE4
	.byte	0x22
	.ascii "track\0"
	.byte	0x1
	.byte	0x6f
	.long	0x1cfe
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x22
	.ascii "l\0"
	.byte	0x1
	.byte	0x72
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x22
	.ascii "currObject\0"
	.byte	0x1
	.byte	0x7a
	.long	0x1d1a
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x0
	.byte	0x0
	.byte	0x26
	.long	LBB5
	.long	LBE5
	.byte	0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0x99
	.long	0xc2
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0x26
	.long	LBB6
	.long	LBE6
	.byte	0x22
	.ascii "track\0"
	.byte	0x1
	.byte	0x9a
	.long	0x1cfe
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1717
	.byte	0x6
	.long	0xc2
	.long	0x1d14
	.byte	0x7
	.long	0x122
	.byte	0x3
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1685
	.byte	0x8
	.byte	0x4
	.long	0x54f
	.byte	0x24
	.set L$set$326,LASF8-Lsection__debug_str
	.long L$set$326
	.byte	0x1
	.byte	0xa4
	.byte	0x1
	.long	LFB214
	.long	LFE214
	.set L$set$327,LLST3-Lsection__debug_loc
	.long L$set$327
	.long	0x1d94
	.byte	0x20
	.set L$set$328,LASF4-Lsection__debug_str
	.long L$set$328
	.byte	0x1
	.byte	0xa4
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$329,LASF5-Lsection__debug_str
	.long L$set$329
	.byte	0x1
	.byte	0xa4
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x21
	.ascii "capacity\0"
	.byte	0x1
	.byte	0xa4
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x26
	.long	LBB7
	.long	LBE7
	.byte	0x22
	.ascii "t\0"
	.byte	0x1
	.byte	0xa6
	.long	0x1cfe
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x26
	.long	LBB8
	.long	LBE8
	.byte	0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0xa8
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1f
	.set L$set$330,LASF10-Lsection__debug_str
	.long L$set$330
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB215
	.long	LFE215
	.set L$set$331,LLST4-Lsection__debug_loc
	.long L$set$331
	.long	0x1dcd
	.byte	0x20
	.set L$set$332,LASF4-Lsection__debug_str
	.long L$set$332
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$333,LASF5-Lsection__debug_str
	.long L$set$333
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$334,LASF11-Lsection__debug_str
	.long L$set$334
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB216
	.long	LFE216
	.set L$set$335,LLST5-Lsection__debug_loc
	.long L$set$335
	.long	0x1e10
	.byte	0x20
	.set L$set$336,LASF4-Lsection__debug_str
	.long L$set$336
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$337,LASF5-Lsection__debug_str
	.long L$set$337
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$338,LASF12-Lsection__debug_str
	.long L$set$338
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$339,LASF13-Lsection__debug_str
	.long L$set$339
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0x632
	.long	LFB217
	.long	LFE217
	.set L$set$340,LLST6-Lsection__debug_loc
	.long L$set$340
	.long	0x1e49
	.byte	0x20
	.set L$set$341,LASF4-Lsection__debug_str
	.long L$set$341
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$342,LASF5-Lsection__debug_str
	.long L$set$342
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$343,LASF14-Lsection__debug_str
	.long L$set$343
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB218
	.long	LFE218
	.set L$set$344,LLST7-Lsection__debug_loc
	.long L$set$344
	.long	0x1e8c
	.byte	0x20
	.set L$set$345,LASF4-Lsection__debug_str
	.long L$set$345
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$346,LASF5-Lsection__debug_str
	.long L$set$346
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$347,LASF12-Lsection__debug_str
	.long L$set$347
	.byte	0x1
	.byte	0x13
	.long	0x632
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$348,LASF15-Lsection__debug_str
	.long L$set$348
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB219
	.long	LFE219
	.set L$set$349,LLST8-Lsection__debug_loc
	.long L$set$349
	.long	0x1ec5
	.byte	0x20
	.set L$set$350,LASF4-Lsection__debug_str
	.long L$set$350
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$351,LASF5-Lsection__debug_str
	.long L$set$351
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$352,LASF16-Lsection__debug_str
	.long L$set$352
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB220
	.long	LFE220
	.set L$set$353,LLST9-Lsection__debug_loc
	.long L$set$353
	.long	0x1f08
	.byte	0x20
	.set L$set$354,LASF4-Lsection__debug_str
	.long L$set$354
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$355,LASF5-Lsection__debug_str
	.long L$set$355
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$356,LASF12-Lsection__debug_str
	.long L$set$356
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$357,LASF17-Lsection__debug_str
	.long L$set$357
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB221
	.long	LFE221
	.set L$set$358,LLST10-Lsection__debug_loc
	.long L$set$358
	.long	0x1f41
	.byte	0x20
	.set L$set$359,LASF4-Lsection__debug_str
	.long L$set$359
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$360,LASF5-Lsection__debug_str
	.long L$set$360
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$361,LASF18-Lsection__debug_str
	.long L$set$361
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB222
	.long	LFE222
	.set L$set$362,LLST11-Lsection__debug_loc
	.long L$set$362
	.long	0x1f84
	.byte	0x20
	.set L$set$363,LASF4-Lsection__debug_str
	.long L$set$363
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$364,LASF5-Lsection__debug_str
	.long L$set$364
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$365,LASF12-Lsection__debug_str
	.long L$set$365
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$366,LASF19-Lsection__debug_str
	.long L$set$366
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB223
	.long	LFE223
	.set L$set$367,LLST12-Lsection__debug_loc
	.long L$set$367
	.long	0x1fbd
	.byte	0x20
	.set L$set$368,LASF4-Lsection__debug_str
	.long L$set$368
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$369,LASF5-Lsection__debug_str
	.long L$set$369
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$370,LASF20-Lsection__debug_str
	.long L$set$370
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB224
	.long	LFE224
	.set L$set$371,LLST13-Lsection__debug_loc
	.long L$set$371
	.long	0x2000
	.byte	0x20
	.set L$set$372,LASF4-Lsection__debug_str
	.long L$set$372
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$373,LASF5-Lsection__debug_str
	.long L$set$373
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$374,LASF12-Lsection__debug_str
	.long L$set$374
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$375,LASF21-Lsection__debug_str
	.long L$set$375
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB225
	.long	LFE225
	.set L$set$376,LLST14-Lsection__debug_loc
	.long L$set$376
	.long	0x2039
	.byte	0x20
	.set L$set$377,LASF4-Lsection__debug_str
	.long L$set$377
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$378,LASF5-Lsection__debug_str
	.long L$set$378
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$379,LASF22-Lsection__debug_str
	.long L$set$379
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB226
	.long	LFE226
	.set L$set$380,LLST15-Lsection__debug_loc
	.long L$set$380
	.long	0x207c
	.byte	0x20
	.set L$set$381,LASF4-Lsection__debug_str
	.long L$set$381
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$382,LASF5-Lsection__debug_str
	.long L$set$382
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$383,LASF12-Lsection__debug_str
	.long L$set$383
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$384,LASF23-Lsection__debug_str
	.long L$set$384
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB227
	.long	LFE227
	.set L$set$385,LLST16-Lsection__debug_loc
	.long L$set$385
	.long	0x20b5
	.byte	0x20
	.set L$set$386,LASF4-Lsection__debug_str
	.long L$set$386
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$387,LASF5-Lsection__debug_str
	.long L$set$387
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$388,LASF24-Lsection__debug_str
	.long L$set$388
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB228
	.long	LFE228
	.set L$set$389,LLST17-Lsection__debug_loc
	.long L$set$389
	.long	0x20f8
	.byte	0x20
	.set L$set$390,LASF4-Lsection__debug_str
	.long L$set$390
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$391,LASF5-Lsection__debug_str
	.long L$set$391
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$392,LASF12-Lsection__debug_str
	.long L$set$392
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$393,LASF25-Lsection__debug_str
	.long L$set$393
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB229
	.long	LFE229
	.set L$set$394,LLST18-Lsection__debug_loc
	.long L$set$394
	.long	0x2131
	.byte	0x20
	.set L$set$395,LASF4-Lsection__debug_str
	.long L$set$395
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$396,LASF5-Lsection__debug_str
	.long L$set$396
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$397,LASF26-Lsection__debug_str
	.long L$set$397
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB230
	.long	LFE230
	.set L$set$398,LLST19-Lsection__debug_loc
	.long L$set$398
	.long	0x2174
	.byte	0x20
	.set L$set$399,LASF4-Lsection__debug_str
	.long L$set$399
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$400,LASF5-Lsection__debug_str
	.long L$set$400
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$401,LASF12-Lsection__debug_str
	.long L$set$401
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$402,LASF27-Lsection__debug_str
	.long L$set$402
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0xc2
	.long	LFB231
	.long	LFE231
	.set L$set$403,LLST20-Lsection__debug_loc
	.long L$set$403
	.long	0x21ad
	.byte	0x20
	.set L$set$404,LASF4-Lsection__debug_str
	.long L$set$404
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$405,LASF5-Lsection__debug_str
	.long L$set$405
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$406,LASF28-Lsection__debug_str
	.long L$set$406
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB232
	.long	LFE232
	.set L$set$407,LLST21-Lsection__debug_loc
	.long L$set$407
	.long	0x21f0
	.byte	0x20
	.set L$set$408,LASF4-Lsection__debug_str
	.long L$set$408
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$409,LASF5-Lsection__debug_str
	.long L$set$409
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$410,LASF12-Lsection__debug_str
	.long L$set$410
	.byte	0x1
	.byte	0x13
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x1f
	.set L$set$411,LASF29-Lsection__debug_str
	.long L$set$411
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0x62c
	.long	LFB233
	.long	LFE233
	.set L$set$412,LLST22-Lsection__debug_loc
	.long L$set$412
	.long	0x2229
	.byte	0x20
	.set L$set$413,LASF4-Lsection__debug_str
	.long L$set$413
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$414,LASF5-Lsection__debug_str
	.long L$set$414
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x24
	.set L$set$415,LASF30-Lsection__debug_str
	.long L$set$415
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	LFB234
	.long	LFE234
	.set L$set$416,LLST23-Lsection__debug_loc
	.long L$set$416
	.long	0x226c
	.byte	0x20
	.set L$set$417,LASF4-Lsection__debug_str
	.long L$set$417
	.byte	0x1
	.byte	0x13
	.long	0x1b5a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x20
	.set L$set$418,LASF5-Lsection__debug_str
	.long L$set$418
	.byte	0x1
	.byte	0x13
	.long	0x50a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x20
	.set L$set$419,LASF12-Lsection__debug_str
	.long L$set$419
	.byte	0x1
	.byte	0x13
	.long	0x62c
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x22
	.ascii "ccWHITE\0"
	.byte	0x11
	.byte	0x3b
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccWHITE
	.byte	0xe
	.long	0x7f3
	.byte	0x22
	.ascii "ccYELLOW\0"
	.byte	0x11
	.byte	0x3d
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccYELLOW
	.byte	0x22
	.ascii "ccBLUE\0"
	.byte	0x11
	.byte	0x3f
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccBLUE
	.byte	0x22
	.ascii "ccGREEN\0"
	.byte	0x11
	.byte	0x41
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccGREEN
	.byte	0x22
	.ascii "ccRED\0"
	.byte	0x11
	.byte	0x43
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccRED
	.byte	0x22
	.ascii "ccMAGENTA\0"
	.byte	0x11
	.byte	0x45
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccMAGENTA
	.byte	0x22
	.ascii "ccBLACK\0"
	.byte	0x11
	.byte	0x47
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccBLACK
	.byte	0x22
	.ascii "ccORANGE\0"
	.byte	0x11
	.byte	0x49
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccORANGE
	.byte	0x22
	.ascii "ccGRAY\0"
	.byte	0x11
	.byte	0x4b
	.long	0x2281
	.byte	0x5
	.byte	0x3
	.long	_ccGRAY
	.byte	0x22
	.ascii "kCDNoBuffer\0"
	.byte	0x21
	.byte	0xe2
	.long	0x2347
	.byte	0x5
	.byte	0x3
	.long	_kCDNoBuffer
	.byte	0xe
	.long	0xc2
	.byte	0x6
	.long	0xc2
	.long	0x2357
	.byte	0x27
	.byte	0x0
	.byte	0x28
	.ascii "__CFConstantStringClassReference\0"
	.long	0x234c
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x29
	.ascii "_DefaultRuneLocale\0"
	.byte	0x3
	.byte	0x84
	.long	0x494
	.byte	0x1
	.byte	0x1
	.byte	0x29
	.ascii "_objc_empty_cache\0"
	.byte	0x1
	.byte	0xae
	.long	0x188
	.byte	0x1
	.byte	0x1
	.byte	0xc
	.byte	0x1
	.long	0x4d3
	.long	0x23cd
	.byte	0xd
	.long	0x4d3
	.byte	0xd
	.long	0x50a
	.byte	0x2a
	.byte	0x0
	.byte	0x29
	.ascii "_objc_empty_vtable\0"
	.byte	0x1
	.byte	0xae
	.long	0x23e9
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.long	0x23b7
	.byte	0x11
	.ascii "_class_t\0"
	.byte	0x14
	.byte	0xe
	.byte	0x0
	.long	0x257b
	.byte	0xa
	.ascii "isa\0"
	.byte	0xe
	.byte	0x0
	.long	0x257b
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "superclass\0"
	.byte	0xe
	.byte	0x0
	.long	0x257b
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "cache\0"
	.byte	0xe
	.byte	0x0
	.long	0x188
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "vtable\0"
	.byte	0xe
	.byte	0x0
	.long	0x2581
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x11
	.ascii "_class_ro_t\0"
	.byte	0x28
	.byte	0xe
	.byte	0x0
	.long	0x256d
	.byte	0xa
	.ascii "flags\0"
	.byte	0xe
	.byte	0x0
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "instanceStart\0"
	.byte	0xe
	.byte	0x0
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "instanceSize\0"
	.byte	0xe
	.byte	0x0
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "ivarLayout\0"
	.byte	0xe
	.byte	0x0
	.long	0x19a
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0xa
	.ascii "name\0"
	.byte	0xe
	.byte	0x0
	.long	0x19a
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x10
	.ascii "_objc_method_list\0"
	.byte	0x1
	.byte	0xa
	.ascii "baseMethods\0"
	.byte	0xe
	.byte	0x0
	.long	0x2587
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x10
	.ascii "_protocol_list_t\0"
	.byte	0x1
	.byte	0xa
	.ascii "baseProtocols\0"
	.byte	0xe
	.byte	0x0
	.long	0x258d
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x10
	.ascii "_ivar_list_t\0"
	.byte	0x1
	.byte	0xa
	.ascii "ivars\0"
	.byte	0xe
	.byte	0x0
	.long	0x2593
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0xa
	.ascii "weakIvarLayout\0"
	.byte	0xe
	.byte	0x0
	.long	0x19a
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x10
	.ascii "_prop_list_t\0"
	.byte	0x1
	.byte	0xa
	.ascii "properties\0"
	.byte	0xe
	.byte	0x0
	.long	0x2599
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x0
	.byte	0xa
	.ascii "ro\0"
	.byte	0xe
	.byte	0x0
	.long	0x259f
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x23ef
	.byte	0x8
	.byte	0x4
	.long	0x23e9
	.byte	0x8
	.byte	0x4
	.long	0x24bb
	.byte	0x8
	.byte	0x4
	.long	0x24e5
	.byte	0x8
	.byte	0x4
	.long	0x2510
	.byte	0x8
	.byte	0x4
	.long	0x2548
	.byte	0x8
	.byte	0x4
	.long	0x2444
	.byte	0x29
	.ascii "OBJC_CLASS_$_NSAssertionHandler\0"
	.byte	0x1
	.byte	0xae
	.long	0x23ef
	.byte	0x1
	.byte	0x1
	.byte	0x29
	.ascii "OBJC_CLASS_$_NSString\0"
	.byte	0x1
	.byte	0xae
	.long	0x23ef
	.byte	0x1
	.byte	0x1
	.byte	0x29
	.ascii "OBJC_CLASS_$_Symbol\0"
	.byte	0x1
	.byte	0xae
	.long	0x23ef
	.byte	0x1
	.byte	0x1
	.byte	0x29
	.ascii "OBJC_CLASS_$_NSMutableArray\0"
	.byte	0x1
	.byte	0xae
	.long	0x23ef
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.section __DWARF,__debug_abbrev,regular,debug
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0xe5,0x7f
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.byte	0x0
	.byte	0x0
	.byte	0x2
	.byte	0x24
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x0
	.byte	0x0
	.byte	0x3
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x4
	.byte	0x24
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x5
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x7
	.byte	0x21
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x8
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x9
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xa
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0xb
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xc
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xd
	.byte	0x5
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xe
	.byte	0x26
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xf
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x10
	.byte	0x13
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x11
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x12
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xe6,0x7f
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x13
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x14
	.byte	0x1c
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x15
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x16
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x17
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x18
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x19
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0xb
	.byte	0xb
	.byte	0xd
	.byte	0xb
	.byte	0xc
	.byte	0xb
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x1a
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1b
	.byte	0x28
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x1c
	.byte	0xd
	.byte	0x0
	.byte	0x0
	.byte	0x1c
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x1d
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xe6,0x7f
	.byte	0xb
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1e
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1f
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x20
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x21
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x22
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x23
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x24
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x25
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x26
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x27
	.byte	0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x28
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x34
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x29
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x2a
	.byte	0x18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section __DWARF,__debug_pubtypes,regular,debug
	.long	0x43d
	.word	0x2
	.set L$set$420,Ldebug_info0-Lsection__debug_info
	.long L$set$420
	.long	0x2630
	.long	0xc9
	.ascii "__uint32_t\0"
	.long	0x12d
	.ascii "__darwin_size_t\0"
	.long	0x159
	.ascii "__darwin_wchar_t\0"
	.long	0x171
	.ascii "__darwin_rune_t\0"
	.long	0x1f1
	.ascii "_RuneEntry\0"
	.long	0x239
	.ascii "_RuneRange\0"
	.long	0x286
	.ascii "_RuneCharClass\0"
	.long	0x494
	.ascii "_RuneLocale\0"
	.long	0x4ba
	.ascii "Class\0"
	.long	0x4dc
	.ascii "objc_object\0"
	.long	0x4d3
	.ascii "id\0"
	.long	0x4ff
	.ascii "SEL\0"
	.long	0x520
	.ascii "BOOL\0"
	.long	0x52c
	.ascii "NSInteger\0"
	.long	0x53d
	.ascii "NSUInteger\0"
	.long	0x54f
	.ascii "NSObject\0"
	.long	0x577
	.ascii "NSArray\0"
	.long	0x592
	.ascii "NSMutableArray\0"
	.long	0x5b4
	.ascii "unichar\0"
	.long	0x5c3
	.ascii "NSString\0"
	.long	0x60c
	.ascii "NSDictionary\0"
	.long	0x5df
	.ascii "NSMutableDictionary\0"
	.long	0x638
	.ascii "CGFloat\0"
	.long	0x6a9
	.ascii "CGPoint\0"
	.long	0x6d2
	.ascii "CGPoint\0"
	.long	0x6e1
	.ascii "CGSize\0"
	.long	0x712
	.ascii "CGSize\0"
	.long	0x720
	.ascii "CGRect\0"
	.long	0x750
	.ascii "CGRect\0"
	.long	0x652
	.ascii "CGAffineTransform\0"
	.long	0x764
	.ascii "GLenum\0"
	.long	0x772
	.ascii "GLint\0"
	.long	0x77f
	.ascii "GLubyte\0"
	.long	0x78e
	.ascii "GLushort\0"
	.long	0x79e
	.ascii "GLuint\0"
	.long	0x7ac
	.ascii "GLfloat\0"
	.long	0x7bb
	.ascii "_ccColor3B\0"
	.long	0x7f3
	.ascii "ccColor3B\0"
	.long	0x804
	.ascii "_ccColor4B\0"
	.long	0x848
	.ascii "ccColor4B\0"
	.long	0x859
	.ascii "_ccVertex3F\0"
	.long	0x892
	.ascii "ccVertex3F\0"
	.long	0x8a4
	.ascii "_ccTex2F\0"
	.long	0x8ce
	.ascii "ccTex2F\0"
	.long	0x8dd
	.ascii "_ccGridSize\0"
	.long	0x90a
	.ascii "ccGridSize\0"
	.long	0x91c
	.ascii "_ccV3F_C4B_T2F\0"
	.long	0x96c
	.ascii "ccV3F_C4B_T2F\0"
	.long	0x981
	.ascii "_ccV3F_C4B_T2F_Quad\0"
	.long	0x9d2
	.ascii "ccV3F_C4B_T2F_Quad\0"
	.long	0x9ec
	.ascii "_ccBlendFunc\0"
	.long	0xa1f
	.ascii "ccBlendFunc\0"
	.long	0xcc2
	.ascii "ccArray\0"
	.long	0xcfd
	.ascii "ccArray\0"
	.long	0xedd
	.ascii "CCTexture2DPixelFormat\0"
	.long	0xefb
	.ascii "CCTexture2D\0"
	.long	0xfb8
	.ascii "CCArray\0"
	.long	0xa33
	.ascii "CCNode\0"
	.long	0xff8
	.ascii "CCCamera\0"
	.long	0x10cb
	.ascii "CCGridBase\0"
	.long	0x11d4
	.ascii "CCTextureAtlas\0"
	.long	0x1318
	.ascii "ccHonorParentTransform\0"
	.long	0x1336
	.ascii "CCSprite\0"
	.long	0x15a0
	.ascii "CCSpriteBatchNode\0"
	.long	0x1621
	.ascii "CCLayer\0"
	.long	0x118a
	.ascii "CCGrabber\0"
	.long	0x1685
	.ascii "Symbol\0"
	.long	0x1704
	.ascii "TrackStatus\0"
	.long	0x1717
	.ascii "Track\0"
	.long	0x18bb
	.ascii "HitGenerator\0"
	.long	0x1b60
	.ascii "_objc_super\0"
	.long	0x23ef
	.ascii "_class_t\0"
	.long	0x0
	.section __DWARF,__debug_aranges,regular,debug
	.long	0x1c
	.word	0x2
	.set L$set$421,Ldebug_info0-Lsection__debug_info
	.long L$set$421
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	Ltext0
	.set L$set$422,Letext0-Ltext0
	.long L$set$422
	.long	0x0
	.long	0x0
	.section __DWARF,__debug_str,regular,debug
LASF25:
	.ascii "-[HitGenerator jokerInterval]\0"
LASF10:
	.ascii "-[HitGenerator timeUpIndex]\0"
LASF7:
	.ascii "-[HitGenerator generateHits]\0"
LASF9:
	.ascii "-[HitGenerator initWithTracks:rows:]\0"
LASF1:
	.ascii "texture_\0"
LASF22:
	.ascii "-[HitGenerator setLiveInterval:]\0"
LASF28:
	.ascii "-[HitGenerator setJokerHitCount:]\0"
LASF5:
	.ascii "_cmd\0"
LASF14:
	.ascii "-[HitGenerator setTimeRewards:]\0"
LASF21:
	.ascii "-[HitGenerator liveInterval]\0"
LASF17:
	.ascii "-[HitGenerator maxTries]\0"
LASF29:
	.ascii "-[HitGenerator hitString]\0"
LASF11:
	.ascii "-[HitGenerator setTimeUpIndex:]\0"
LASF12:
	.ascii "_value\0"
LASF2:
	.ascii "textureAtlas_\0"
LASF27:
	.ascii "-[HitGenerator jokerHitCount]\0"
LASF4:
	.ascii "self\0"
LASF19:
	.ascii "-[HitGenerator minHits]\0"
LASF30:
	.ascii "-[HitGenerator setHitString:]\0"
LASF20:
	.ascii "-[HitGenerator setMinHits:]\0"
LASF15:
	.ascii "-[HitGenerator trioStairRatio]\0"
LASF16:
	.ascii "-[HitGenerator setTrioStairRatio:]\0"
LASF8:
	.ascii "-[HitGenerator initSymbolArrays:]\0"
LASF0:
	.ascii "CGAffineTransform\0"
LASF26:
	.ascii "-[HitGenerator setJokerInterval:]\0"
LASF6:
	.ascii "-[HitGenerator generateHits:]\0"
LASF24:
	.ascii "-[HitGenerator setLiveHitCount:]\0"
LASF23:
	.ascii "-[HitGenerator liveHitCount]\0"
LASF13:
	.ascii "-[HitGenerator timeRewards]\0"
LASF3:
	.ascii "blendFunc_\0"
LASF18:
	.ascii "-[HitGenerator setMaxTries:]\0"
	.data
	.align 2
L_OBJC_IVAR_$_HitGenerator.generationIndex$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.generationIndex
	.align 2
L_OBJC_IVAR_$_HitGenerator.timeRewards$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.timeRewards
	.align 2
L_OBJC_IVAR_$_HitGenerator.jokerHitCount$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.jokerHitCount
	.align 2
L_OBJC_IVAR_$_HitGenerator.timeUpIndex$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.timeUpIndex
	.align 2
L_OBJC_IVAR_$_HitGenerator.minHits$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.minHits
	.align 2
L_OBJC_IVAR_$_HitGenerator.maxTries$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.maxTries
	.align 2
L_OBJC_IVAR_$_HitGenerator.rows$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.rows
	.align 2
L_OBJC_IVAR_$_HitGenerator.tracks$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.tracks
	.align 2
L_OBJC_IVAR_$_HitGenerator.liveInterval$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.liveInterval
	.align 2
L_OBJC_IVAR_$_HitGenerator.hits$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.hits
	.align 2
L_OBJC_IVAR_$_HitGenerator.jokerHitStatus$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.jokerHitStatus
	.align 2
L_OBJC_IVAR_$_HitGenerator.typeHit$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.typeHit
	.align 2
L_OBJC_IVAR_$_HitGenerator.timeRewardIndex$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.timeRewardIndex
	.align 2
L_OBJC_IVAR_$_HitGenerator.jokerInterval$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.jokerInterval
	.align 2
L_OBJC_IVAR_$_HitGenerator.tries$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.tries
	.align 2
L_OBJC_IVAR_$_HitGenerator.liveIndex$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.liveIndex
	.align 2
L_OBJC_IVAR_$_HitGenerator.isHit$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.isHit
	.align 2
L_OBJC_IVAR_$_HitGenerator.jokerIndex$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.jokerIndex
	.align 2
L_OBJC_IVAR_$_HitGenerator.trioStairRatio$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.trioStairRatio
	.align 2
L_OBJC_IVAR_$_HitGenerator.liveHitStatus$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.liveHitStatus
	.align 2
L_OBJC_IVAR_$_HitGenerator.hitString$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.hitString
	.align 2
L_OBJC_IVAR_$_HitGenerator.liveHitCount$non_lazy_ptr:
	.long	_OBJC_IVAR_$_HitGenerator.liveHitCount
	.subsections_via_symbols
