	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069924
sub_08069924: @ 0x08069924
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r2, _080699BC @ =gDispIo
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	strb r0, [r2]
	ldr r3, _080699C0 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r4, _080699C4 @ =gUnknown_030030B4
	ldrb r2, [r4]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r4]
	ldr r2, _080699C8 @ =gUnknown_03001FE8
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2]
	ldr r2, _080699CC @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08063994
	adds r0, r4, #0
	movs r1, #1
	bl sub_08012C48
	movs r0, #0
	str r0, [sp]
	ldr r5, _080699D0 @ =gUnknown_08499580
	ldr r1, [r5]
	ldr r2, _080699D4 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldrb r0, [r4, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, _080699D8 @ =gUnknown_0817DA18
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r6, #0
	beq _080699A8
	ldr r0, _080699DC @ =gUnknown_0817DA38
	ldr r1, _080699E0 @ =0x06008000
	bl Decompress
_080699A8:
	ldr r0, _080699E4 @ =gUnknown_0817E208
	ldr r1, [r5]
	bl Decompress
	bl sub_08013B0C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080699BC: .4byte gDispIo
_080699C0: .4byte gUnknown_03002B6C
_080699C4: .4byte gUnknown_030030B4
_080699C8: .4byte gUnknown_03001FE8
_080699CC: .4byte gUnknown_0300251C
_080699D0: .4byte gUnknown_08499580
_080699D4: .4byte 0x01000200
_080699D8: .4byte gUnknown_0817DA18
_080699DC: .4byte gUnknown_0817DA38
_080699E0: .4byte 0x06008000
_080699E4: .4byte gUnknown_0817E208

