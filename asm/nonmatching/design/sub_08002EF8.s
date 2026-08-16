	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002EF8
sub_08002EF8: @ 0x08002EF8
	push {lr}
	ldr r0, _08002F18 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xaa
	cmp r0, #0
	bne _08002F0C
	movs r1, #0xab
_08002F0C:
	movs r0, #0xaa
	bl sub_0801F1EC
	pop {r0}
	bx r0
	.align 2, 0
_08002F18: .4byte gUnknown_0200B0B0

