	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042B9C
sub_08042B9C: @ 0x08042B9C
	push {r4, r5, lr}
	bl sub_08035170
	ldr r1, _08042BF4 @ =gUnknown_03003FC0
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r2, _08042BF8 @ =gUnknown_030044B0
	ldr r0, _08042BFC @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r2, #8]
	adds r1, #0x32
	ldrb r0, [r1]
	cmp r0, #0
	bne _08042BE4
	ldr r5, _08042C00 @ =gUnknown_030033EC
	ldrh r1, [r5]
	ldr r4, _08042C04 @ =gUnknown_08499598
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, _08042C08 @ =gUnknown_030033E4
	ldrh r1, [r3]
	adds r0, #0x2f
	strb r1, [r0]
	ldrh r1, [r5]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #2]
	adds r0, #0x30
	strb r1, [r0]
_08042BE4:
	ldr r1, _08042C0C @ =gUnknown_030032D8
	movs r0, #1
	strh r0, [r1]
	bl sub_08025EA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042BF4: .4byte gUnknown_03003FC0
_08042BF8: .4byte gUnknown_030044B0
_08042BFC: .4byte gUnknown_03001FD4
_08042C00: .4byte gUnknown_030033EC
_08042C04: .4byte gUnknown_08499598
_08042C08: .4byte gUnknown_030033E4
_08042C0C: .4byte gUnknown_030032D8

