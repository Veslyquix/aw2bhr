	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080148E0
sub_080148E0: @ 0x080148E0
	push {lr}
	sub sp, #4
	ldr r1, _0801490C @ =gUnknown_0200BC14
	movs r3, #0x81
	lsls r3, r3, #3
	adds r2, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #1
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r3, #0
	bl sub_0801489C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0801490C: .4byte gUnknown_0200BC14

