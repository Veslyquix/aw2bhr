	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049B80
sub_08049B80: @ 0x08049B80
	push {lr}
	ldr r0, _08049B9C @ =gUnknown_084C30F8
	ldr r0, [r0]
	ldr r2, _08049BA0 @ =0x00000836
	adds r1, r0, r2
	adds r2, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08049BA4
	bl sub_0803BD60
	b _08049BA8
	.align 2, 0
_08049B9C: .4byte gUnknown_084C30F8
_08049BA0: .4byte 0x00000836
_08049BA4:
	bl sub_0803BD54
_08049BA8:
	pop {r0}
	bx r0

