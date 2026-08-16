	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026254
sub_08026254: @ 0x08026254
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _0802628C @ =gUnknown_08090A5C
	ldr r2, [r0]
	ldrb r1, [r2]
	adds r4, r0, #0
	cmp r1, #0xff
	beq _08026274
	adds r1, r2, #0
_08026266:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08026266
_08026274:
	ldr r4, [r4]
	bl sub_080129E0
	adds r1, r5, #0
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802628C: .4byte gUnknown_08090A5C

