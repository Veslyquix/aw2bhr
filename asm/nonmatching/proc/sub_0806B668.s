	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B668
sub_0806B668: @ 0x0806B668
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, [r6, #0x5c]
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0
	bl sub_08074234
	adds r5, r0, #0
	movs r1, #2
	rsbs r1, r1, #0
	movs r2, #8
	rsbs r2, r2, #0
	ldr r3, [r6, #0x5c]
	str r4, [sp]
	movs r0, #0
	bl sub_08074234
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	lsls r1, r4, #0xf
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #2
	adds r2, r4, #0
	bl sub_08072C40
	ldr r2, _0806B6E0 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0806B6E4 @ =gUnknown_03002020
	asrs r1, r5, #1
	movs r0, #1
	ands r5, r0
	adds r5, r1, r5
	strh r5, [r2]
	ldr r0, _0806B6E8 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _0806B6EC @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r6, #0x5c]
	cmp r0, #0x3b
	ble _0806B6F0
	adds r0, r6, #0
	bl Proc_Break
	b _0806B6F4
	.align 2, 0
_0806B6E0: .4byte gUnknown_030030E0
_0806B6E4: .4byte gUnknown_03002020
_0806B6E8: .4byte gUnknown_03002B28
_0806B6EC: .4byte gUnknown_03001FFC
_0806B6F0:
	adds r0, #1
	str r0, [r6, #0x5c]
_0806B6F4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

