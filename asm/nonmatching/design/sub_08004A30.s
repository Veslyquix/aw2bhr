	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004A30
sub_08004A30: @ 0x08004A30
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0801A168
	adds r0, r4, #0
	bl sub_08003C48
	bl sub_08002E3C
	bl sub_08024268
	ldr r0, _08004A5C @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004A5C: .4byte gUnknown_0200B0B0

