	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B91C
sub_0808B91C: @ 0x0808B91C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r4, r0, #0
	bl __extendsfdf2
	ldr r3, _0808B948 @ =0x54442D18
	ldr r2, _0808B944 @ =0x400921FB
	bl __divdf3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r1, _0808B94C @ =0x00000000
	adds r0, r4, #0
	bl __gesf2
	cmp r0, #0
	blt _0808B958
	ldr r2, _0808B950 @ =0x3FE00000
	ldr r3, _0808B954 @ =0x00000000
	b _0808B95C
	.align 2, 0
_0808B944: .4byte 0x400921FB
_0808B948: .4byte 0x54442D18
_0808B94C: .4byte 0x00000000
_0808B950: .4byte 0x3FE00000
_0808B954: .4byte 0x00000000
_0808B958:
	ldr r3, _0808BAAC @ =0x00000000
	ldr r2, _0808BAA8 @ =0xBFE00000
_0808B95C:
	adds r1, r6, #0
	adds r0, r5, #0
	bl __adddf3
	bl __fixdfsi
	adds r7, r0, #0
	adds r0, r4, #0
	bl __extendsfdf2
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	bl __floatsidf
	ldr r2, _0808BAB0 @ =0x400921FB
	ldr r3, _0808BAB4 @ =0x54442D18
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __subdf3
	bl __truncdfsf2
	adds r4, r0, #0
	adds r1, r4, #0
	bl __mulsf3
	adds r4, r0, #0
	adds r1, r4, #0
	bl __mulsf3
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
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl __extendsfdf2
	ldr r2, _0808BAB8 @ =0x3D2AE7F3
	ldr r3, _0808BABC @ =0xE733B5BD
	bl __muldf3
	ldr r2, _0808BAC0 @ =0xBDA93974
	ldr r3, _0808BAC4 @ =0xA8C07D48
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r6, #0
	adds r0, r5, #0
	bl __muldf3
	ldr r2, _0808BAC8 @ =0x3E21EED8
	ldr r3, _0808BACC @ =0xEFF8DA63
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	bl __muldf3
	ldr r2, _0808BAD0 @ =0xBE927E4F
	ldr r3, _0808BAD4 @ =0xB778A265
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldf3
	ldr r2, _0808BAD8 @ =0x3EFA01A0
	ldr r3, _0808BADC @ =0x1A01A336
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldf3
	ldr r2, _0808BAE0 @ =0xBF56C16C
	ldr r3, _0808BAE4 @ =0x16C16E17
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldf3
	ldr r2, _0808BAE8 @ =0x3FA55555
	ldr r3, _0808BAEC @ =0x55555736
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldf3
	bl __truncdfsf2
	adds r6, r0, #0
	ldr r1, _0808BAF0 @ =0x3F000000
	adds r0, r4, #0
	bl __mulsf3
	bl __extendsfdf2
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, _0808BAF4 @ =0x3FF00000
	ldr r1, _0808BAF8 @ =0x00000000
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	bl __extendsfdf2
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	bl __truncdfsf2
	adds r4, r0, #0
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	bne _0808BAFC
	adds r0, r4, #0
	b _0808BB02
	.align 2, 0
_0808BAA8: .4byte 0xBFE00000
_0808BAAC: .4byte 0x00000000
_0808BAB0: .4byte 0x400921FB
_0808BAB4: .4byte 0x54442D18
_0808BAB8: .4byte 0x3D2AE7F3
_0808BABC: .4byte 0xE733B5BD
_0808BAC0: .4byte 0xBDA93974
_0808BAC4: .4byte 0xA8C07D48
_0808BAC8: .4byte 0x3E21EED8
_0808BACC: .4byte 0xEFF8DA63
_0808BAD0: .4byte 0xBE927E4F
_0808BAD4: .4byte 0xB778A265
_0808BAD8: .4byte 0x3EFA01A0
_0808BADC: .4byte 0x1A01A336
_0808BAE0: .4byte 0xBF56C16C
_0808BAE4: .4byte 0x16C16E17
_0808BAE8: .4byte 0x3FA55555
_0808BAEC: .4byte 0x55555736
_0808BAF0: .4byte 0x3F000000
_0808BAF4: .4byte 0x3FF00000
_0808BAF8: .4byte 0x00000000
_0808BAFC:
	adds r0, r4, #0
	bl __negsf2
_0808BB02:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

