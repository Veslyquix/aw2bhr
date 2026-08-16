	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C958
sub_0802C958: @ 0x0802C958
	push {lr}
	bl sub_0802C8F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C990
	bl sub_0802CBA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C990
	movs r0, #0xff
	bl sub_0801F838
	ldr r2, _0802C994 @ =gUnknown_03003340
	ldr r1, _0802C998 @ =gUnknown_03003100
	ldrh r0, [r1, #2]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl sub_0804151C
	cmp r0, #0
	bne _0802C99C
_0802C990:
	movs r0, #1
	b _0802C99E
	.align 2, 0
_0802C994: .4byte gUnknown_03003340
_0802C998: .4byte gUnknown_03003100
_0802C99C:
	movs r0, #0
_0802C99E:
	pop {r1}
	bx r1
	.align 2, 0

