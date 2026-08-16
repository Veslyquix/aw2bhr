	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C254
sub_0801C254: @ 0x0801C254
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C262
	ldr r0, [r4]
	cmp r0, #0
	bne _0801C266
_0801C262:
	movs r0, #0
	b _0801C276
_0801C266:
	adds r0, r4, #0
	bl sub_0801C27C
	adds r0, r4, #0
	bl sub_0801C2DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0801C276:
	pop {r4}
	pop {r1}
	bx r1

