	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019D0C
sub_08019D0C: @ 0x08019D0C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019B80
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019D20
	adds r0, r4, #0
	bl sub_08019A60
_08019D20:
	ldr r0, _08019D44 @ =gUnknown_0848A42C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08019D3C
	ldr r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r1, [r1]
	strh r1, [r0, #0x20]
_08019D3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019D44: .4byte gUnknown_0848A42C

