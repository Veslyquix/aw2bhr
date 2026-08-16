	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CDA4
sub_0802CDA4: @ 0x0802CDA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r1, sp
	ldr r0, _0802CDF8 @ =gUnknown_08090BE4
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _0802CDFC @ =gUnknown_03003FC0
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0802CDD4
	movs r0, #0
	strb r0, [r4, #9]
_0802CDD4:
	ldrb r0, [r4, #9]
	lsls r0, r0, #2
	add r0, sp
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	bl sub_08019E68
	ldr r1, _0802CE00 @ =gUnknown_0200C420
	ldrb r0, [r4, #9]
	strb r0, [r1, #0xe]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CDF8: .4byte gUnknown_08090BE4
_0802CDFC: .4byte gUnknown_03003FC0
_0802CE00: .4byte gUnknown_0200C420

