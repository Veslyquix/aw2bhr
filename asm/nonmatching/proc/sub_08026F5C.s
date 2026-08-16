	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026F5C
sub_08026F5C: @ 0x08026F5C
	push {r4, lr}
	ldr r1, _08026F8C @ =gUnknown_030033EC
	ldrh r3, [r1]
	ldr r1, _08026F90 @ =gUnknown_08499598
	ldr r4, [r1]
	lsls r2, r3, #4
	subs r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r2, #0x2a
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x66
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08026F94
	movs r0, #0
	b _08026F96
	.align 2, 0
_08026F8C: .4byte gUnknown_030033EC
_08026F90: .4byte gUnknown_08499598
_08026F94:
	movs r0, #1
_08026F96:
	pop {r4}
	pop {r1}
	bx r1

