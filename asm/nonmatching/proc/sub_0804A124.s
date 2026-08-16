	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A124
sub_0804A124: @ 0x0804A124
	push {lr}
	ldr r1, _0804A154 @ =gUnknown_02028E40
	ldr r0, _0804A158 @ =gUnknown_0200C420
	ldrb r0, [r0, #8]
	lsrs r0, r0, #6
	strb r0, [r1]
	ldr r0, _0804A15C @ =gUnknown_0812A178
	ldr r2, [r0]
	ldrb r1, [r2]
	adds r3, r0, #0
	cmp r1, #0xa5
	bne _0804A160
	ldrb r0, [r2, #1]
	cmp r0, #0x5a
	bne _0804A160
	ldrb r0, [r2, #2]
	cmp r0, #0xc3
	bne _0804A160
	ldrb r0, [r2, #3]
	cmp r0, #0x3c
	bne _0804A160
	bl sub_0806A454
	b _0804A174
	.align 2, 0
_0804A154: .4byte gUnknown_02028E40
_0804A158: .4byte gUnknown_0200C420
_0804A15C: .4byte gUnknown_0812A178
_0804A160:
	ldr r1, [r3]
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	bl sub_0803B588
	ldr r0, _0804A178 @ =gUnknown_084C383C
	movs r1, #0
	bl sub_080152EC
_0804A174:
	pop {r0}
	bx r0
	.align 2, 0
_0804A178: .4byte gUnknown_084C383C

