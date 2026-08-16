	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080735EC
sub_080735EC: @ 0x080735EC
	push {r4, lr}
	ldr r1, _0807363C @ =gUnknown_0202FDE4
	ldr r0, _08073640 @ =gUnknown_0202F8DC
	str r0, [r1]
	movs r2, #0
	adds r4, r1, #0
	movs r3, #0x10
_080735FA:
	ldr r1, [r4]
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r3, [r0]
	adds r2, #1
	cmp r2, #0x9f
	ble _080735FA
	ldr r2, _08073644 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08073648 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0807364C @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r0, _08073650 @ =gUnknown_03001FFC
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r0, _08073654 @ =0x0000FFE0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807363C: .4byte gUnknown_0202FDE4
_08073640: .4byte gUnknown_0202F8DC
_08073644: .4byte gUnknown_030030E0
_08073648: .4byte gUnknown_03002020
_0807364C: .4byte gUnknown_03002B28
_08073650: .4byte gUnknown_03001FFC
_08073654: .4byte 0x0000FFE0

