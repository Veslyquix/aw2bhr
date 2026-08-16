	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080148A0
sub_080148A0: @ 0x080148A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r1, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r5, _080148DC @ =gUnknown_0200BC14
	lsls r1, r3, #1
	movs r6, #0x81
	lsls r6, r6, #3
	adds r4, r5, r6
	adds r4, r1, r4
	adds r1, r1, r5
	ldrh r1, [r1]
	lsls r1, r1, #1
	ldrh r4, [r4]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r4, #0
	str r4, [sp]
	bl sub_0801489C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080148DC: .4byte gUnknown_0200BC14

