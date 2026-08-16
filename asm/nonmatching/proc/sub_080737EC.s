	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080737EC
sub_080737EC: @ 0x080737EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0xf0
	lsls r2, r2, #1
	ldr r3, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	str r0, [sp]
	movs r0, #4
	movs r1, #1
	bl Interpolate
	adds r3, r0, #0
	ldr r5, _080738CC @ =gUnknown_0202FDE4
	ldr r0, _080738D0 @ =gUnknown_0202F8DC
	str r0, [r5]
	adds r2, r3, #0
	cmp r3, #0
	bge _08073818
	movs r2, #0
_08073818:
	cmp r2, #0xf0
	ble _0807381E
	movs r2, #0xf0
_0807381E:
	ldr r1, _080738D4 @ =gUnknown_03002B68
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080738D8 @ =gUnknown_030024E4
	lsls r0, r2, #1
	strb r0, [r1]
	ldr r0, _080738DC @ =gDispIo
	mov r8, r0
	ldrb r0, [r0, #1]
	movs r1, #0x40
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, #1]
	ldr r2, _080738E0 @ =gUnknown_030030A4
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, _080738E4 @ =gUnknown_030030DC
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	bl sub_08073714
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r2, _080738E8 @ =0x040000BA
	movs r6, #0
	strh r6, [r2]
	ldr r7, _080738EC @ =0x040000B0
	ldr r0, [r5]
	str r0, [r7]
	ldr r5, _080738F0 @ =0x040000B4
	ldr r0, _080738F4 @ =0x04000042
	str r0, [r5]
	ldr r3, _080738F8 @ =0x040000B8
	movs r0, #1
	strh r0, [r3]
	ldr r1, _080738FC @ =0x0000A240
	adds r0, r1, #0
	strh r0, [r2]
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	blt _080738C0
	strh r6, [r2]
	movs r0, #0
	str r0, [r7]
	str r0, [r5]
	strh r0, [r3]
	mov r0, r8
	ldrb r1, [r0, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, r8
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl Proc_Break
_080738C0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080738CC: .4byte gUnknown_0202FDE4
_080738D0: .4byte gUnknown_0202F8DC
_080738D4: .4byte gUnknown_03002B68
_080738D8: .4byte gUnknown_030024E4
_080738DC: .4byte gDispIo
_080738E0: .4byte gUnknown_030030A4
_080738E4: .4byte gUnknown_030030DC
_080738E8: .4byte 0x040000BA
_080738EC: .4byte 0x040000B0
_080738F0: .4byte 0x040000B4
_080738F4: .4byte 0x04000042
_080738F8: .4byte 0x040000B8
_080738FC: .4byte 0x0000A240

