	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066B6C
sub_08066B6C: @ 0x08066B6C
	push {lr}
	ldr r0, _08066B80 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08066B84
	bl sub_0806630C
	b _08066B88
	.align 2, 0
_08066B80: .4byte gUnknown_08580934
_08066B84:
	bl sub_08066B40
_08066B88:
	pop {r0}
	bx r0

