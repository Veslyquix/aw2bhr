	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080448E4
sub_080448E4: @ 0x080448E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804491C @ =gUnknown_030033EC
	ldrh r0, [r0]
	movs r1, #1
	bl sub_0805C290
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x66
	strh r0, [r4]
	cmp r0, #0
	beq _08044916
	ldr r2, _08044920 @ =gUnknown_08499594
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
_08044916:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804491C: .4byte gUnknown_030033EC
_08044920: .4byte gUnknown_08499594

