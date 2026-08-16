	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C410
sub_0806C410: @ 0x0806C410
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0806C464 @ =gUnknown_0202F2C0
	ldr r0, [r0]
	cmp r0, #0
	beq _0806C422
	bl sub_0806C1E4
_0806C422:
	ldr r3, _0806C468 @ =gUnknown_085816F0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #4
	adds r0, r1, r3
	movs r4, #0xc
	ldrsh r2, [r0, r4]
	adds r2, #0x54
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	adds r3, #8
	adds r1, r1, r3
	ldr r3, [r1]
	ldr r0, _0806C46C @ =0x00001090
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa4
	bl sub_0801BEFC
	ldr r3, _0806C470 @ =gUnknown_08581A98
	movs r0, #0xd0
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa4
	movs r2, #0x40
	bl sub_0801BEBC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C464: .4byte gUnknown_0202F2C0
_0806C468: .4byte gUnknown_085816F0
_0806C46C: .4byte 0x00001090
_0806C470: .4byte gUnknown_08581A98

