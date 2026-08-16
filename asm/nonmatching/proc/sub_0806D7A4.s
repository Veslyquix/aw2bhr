	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D7A4
sub_0806D7A4: @ 0x0806D7A4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	adds r0, r0, r1
	str r0, [r4, #0x34]
	ldr r1, [r4, #0x24]
	adds r3, r1, r0
	str r3, [r4, #0x24]
	ldr r1, _0806D7DC @ =gUnknown_08581F12
	ldr r0, [r4, #0x3c]
	cmp r0, r1
	bne _0806D7E4
	ldr r0, _0806D7E0 @ =0x000001FF
	ands r3, r0
	ldr r2, [r4, #0x28]
	movs r0, #0xff
	ands r2, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x8c
	adds r1, r3, #0
	movs r3, #0
	bl sub_0801F34C
	b _0806D7FC
	.align 2, 0
_0806D7DC: .4byte gUnknown_08581F12
_0806D7E0: .4byte 0x000001FF
_0806D7E4:
	ldr r0, _0806D818 @ =0x000001FF
	ands r3, r0
	ldr r2, [r4, #0x28]
	movs r0, #0xff
	ands r2, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x8d
	adds r1, r3, #0
	movs r3, #0
	bl sub_0801F34C
_0806D7FC:
	ldr r0, [r4, #0x24]
	adds r0, #0x30
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	bls _0806D810
	ldr r0, _0806D81C @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0806D810:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D818: .4byte 0x000001FF
_0806D81C: .4byte gUnknown_03001FBC

