	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080266DC
sub_080266DC: @ 0x080266DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080266FC @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _08026700
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	bne _08026700
	movs r0, #1
	b _08026702
	.align 2, 0
_080266FC: .4byte gUnknown_08499598
_08026700:
	movs r0, #0
_08026702:
	bx lr

