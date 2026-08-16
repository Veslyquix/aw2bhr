	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B710
sub_0808B710: @ 0x0808B710
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x30
	adds r7, r0, #0
	bl __extendsfdf2
	ldr r3, _0808B740 @ =0x54442D18
	ldr r2, _0808B73C @ =0x400921FB
	bl __divdf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r1, _0808B744 @ =0x00000000
	adds r0, r7, #0
	bl __gesf2
	cmp r0, #0
	blt _0808B750
	ldr r2, _0808B748 @ =0x3FE00000
	ldr r3, _0808B74C @ =0x00000000
	b _0808B754
	.align 2, 0
_0808B73C: .4byte 0x400921FB
_0808B740: .4byte 0x54442D18
_0808B744: .4byte 0x00000000
_0808B748: .4byte 0x3FE00000
_0808B74C: .4byte 0x00000000
_0808B750:
	ldr r3, _0808B8B4 @ =0x00000000
	ldr r2, _0808B8B0 @ =0xBFE00000
_0808B754:
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	bl __fixdfsi
	mov r8, r0
	adds r0, r7, #0
	bl __extendsfdf2
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, r8
	bl __floatsidf
	ldr r2, _0808B8B8 @ =0x400921FB
	ldr r3, _0808B8BC @ =0x54442D18
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __subdf3
	bl __truncdfsf2
	adds r7, r0, #0
	bl sub_0808BB0C
	bl __extendsfdf2
	ldr r2, _0808B8C0 @ =0x3E800000
	ldr r3, _0808B8C4 @ =0x0102F4FD
	bl __gtdf2
	cmp r0, #0
	bgt _0808B7A2
	b _0808B8A0
_0808B7A2:
	adds r0, r7, #0
	adds r1, r7, #0
	bl __mulsf3
	adds r4, r0, #0
	bl __extendsfdf2
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	bl __extendsfdf2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	bl __extendsfdf2
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r0, r4, #0
	bl __extendsfdf2
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	adds r0, r4, #0
	bl __extendsfdf2
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r4, #0
	bl __extendsfdf2
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	adds r0, r4, #0
	bl __extendsfdf2
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl __extendsfdf2
	ldr r2, _0808B8C8 @ =0x3CE952C7
	ldr r3, _0808B8CC @ =0x7030B209
	bl __muldf3
	ldr r2, _0808B8D0 @ =0xBD6AE7F3
	ldr r3, _0808B8D4 @ =0xE733B8D5
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r6, #0
	adds r0, r5, #0
	bl __muldf3
	ldr r2, _0808B8D8 @ =0x3DE61246
	ldr r3, _0808B8DC @ =0x13A86A99
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	bl __muldf3
	ldr r2, _0808B8E0 @ =0xBE5AE645
	ldr r3, _0808B8E4 @ =0x67F542DC
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	bl __muldf3
	ldr r2, _0808B8E8 @ =0x3EC71DE3
	ldr r3, _0808B8EC @ =0xA556CAFE
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldf3
	ldr r2, _0808B8F0 @ =0xBF2A01A0
	ldr r3, _0808B8F4 @ =0x1A01A055
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldf3
	ldr r2, _0808B8F8 @ =0x3F811111
	ldr r3, _0808B8FC @ =0x11111051
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldf3
	ldr r2, _0808B900 @ =0xBFC55555
	ldr r3, _0808B904 @ =0x55555A06
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldf3
	bl __truncdfsf2
	adds r1, r0, #0
	adds r0, r7, #0
	bl __mulsf3
	adds r1, r0, #0
	adds r0, r7, #0
	bl __addsf3
	adds r7, r0, #0
_0808B8A0:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _0808B908
	adds r0, r7, #0
	b _0808B90E
	.align 2, 0
_0808B8B0: .4byte 0xBFE00000
_0808B8B4: .4byte 0x00000000
_0808B8B8: .4byte 0x400921FB
_0808B8BC: .4byte 0x54442D18
_0808B8C0: .4byte 0x3E800000
_0808B8C4: .4byte 0x0102F4FD
_0808B8C8: .4byte 0x3CE952C7
_0808B8CC: .4byte 0x7030B209
_0808B8D0: .4byte 0xBD6AE7F3
_0808B8D4: .4byte 0xE733B8D5
_0808B8D8: .4byte 0x3DE61246
_0808B8DC: .4byte 0x13A86A99
_0808B8E0: .4byte 0xBE5AE645
_0808B8E4: .4byte 0x67F542DC
_0808B8E8: .4byte 0x3EC71DE3
_0808B8EC: .4byte 0xA556CAFE
_0808B8F0: .4byte 0xBF2A01A0
_0808B8F4: .4byte 0x1A01A055
_0808B8F8: .4byte 0x3F811111
_0808B8FC: .4byte 0x11111051
_0808B900: .4byte 0xBFC55555
_0808B904: .4byte 0x55555A06
_0808B908:
	adds r0, r7, #0
	bl __negsf2
_0808B90E:
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

