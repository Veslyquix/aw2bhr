	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C840
sub_0800C840: @ 0x0800C840
	push {r4, lr}
	ldr r2, _0800C868 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _0800C86C @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	ldr r0, _0800C870 @ =0x00001432
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	bl sub_0800C7E8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800C868: .4byte gUnknown_08499590
_0800C86C: .4byte 0x0000417A
_0800C870: .4byte 0x00001432

