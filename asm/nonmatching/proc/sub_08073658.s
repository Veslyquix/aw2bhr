	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073658
sub_08073658: @ 0x08073658
	push {r4, r5, r6, lr}
	ldr r0, _080736A8 @ =gUnknown_081CC028
	ldr r2, [r0]
	ldr r1, _080736AC @ =gUnknown_0202F8DC
	str r1, [r2]
	movs r3, #0
	adds r6, r0, #0
	adds r5, r2, #0
	movs r4, #0x84
	lsls r4, r4, #1
	ldr r2, _080736B0 @ =gUnknown_08614154
_0807366E:
	ldr r0, [r5]
	lsls r1, r3, #1
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x1b
	ble _0807366E
	ldr r2, _080736B4 @ =0x040000BA
	movs r0, #0
	strh r0, [r2]
	ldr r1, _080736B8 @ =0x040000B0
	ldr r0, [r6]
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	ldr r0, _080736BC @ =0x04000054
	str r0, [r1]
	adds r1, #4
	movs r0, #1
	strh r0, [r1]
	ldr r1, _080736C0 @ =0x0000A240
	adds r0, r1, #0
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080736A8: .4byte gUnknown_081CC028
_080736AC: .4byte gUnknown_0202F8DC
_080736B0: .4byte gUnknown_08614154
_080736B4: .4byte 0x040000BA
_080736B8: .4byte 0x040000B0
_080736BC: .4byte 0x04000054
_080736C0: .4byte 0x0000A240

