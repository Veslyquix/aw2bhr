	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804203C
sub_0804203C: @ 0x0804203C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08042078 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	ldrb r1, [r4]
	bl sub_08042D50
	cmp r0, #1
	beq _08042072
	ldrh r1, [r4, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0804207C
_08042072:
	movs r0, #0
	b _0804207E
	.align 2, 0
_08042078: .4byte gUnknown_08499594
_0804207C:
	movs r0, #1
_0804207E:
	pop {r4}
	pop {r1}
	bx r1

