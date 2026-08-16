	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017C4C
sub_08017C4C: @ 0x08017C4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08017C6C @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08017C66
	movs r0, #0
	str r0, [r4, #8]
_08017C66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017C6C: .4byte gUnknown_0849A00C

