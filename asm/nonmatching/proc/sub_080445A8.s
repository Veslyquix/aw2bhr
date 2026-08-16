	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080445A8
sub_080445A8: @ 0x080445A8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0801DA94
	ldr r3, _080445E8 @ =gUnknown_084A0090
	ldr r0, _080445EC @ =gUnknown_030033EC
	ldrh r4, [r0]
	ldr r0, _080445F0 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x1f]
	subs r1, #1
	lsls r2, r1, #2
	adds r2, r2, r1
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x20
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	bne _080445F4
	adds r0, r5, #0
	bl Proc_End
	b _0804460A
	.align 2, 0
_080445E8: .4byte gUnknown_084A0090
_080445EC: .4byte gUnknown_030033EC
_080445F0: .4byte gUnknown_08499598
_080445F4:
	adds r0, r4, #0
	bl sub_08044AB8
	adds r1, r5, #0
	adds r1, #0x68
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	strh r2, [r0]
_0804460A:
	pop {r4, r5}
	pop {r0}
	bx r0

