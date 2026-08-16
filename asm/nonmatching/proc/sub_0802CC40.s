	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CC40
sub_0802CC40: @ 0x0802CC40
	push {lr}
	bl sub_0802C8F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CC7C
	bl sub_0802CBA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CC7C
	ldr r0, _0802CC80 @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_08042084
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CC7C
	movs r0, #0xff
	bl sub_0801F838
	ldr r1, _0802CC84 @ =gUnknown_03003100
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	bl sub_080203C0
	bl sub_080416A4
	cmp r0, #0
	bne _0802CC88
_0802CC7C:
	movs r0, #1
	b _0802CC8A
	.align 2, 0
_0802CC80: .4byte gUnknown_030040D8
_0802CC84: .4byte gUnknown_03003100
_0802CC88:
	movs r0, #0
_0802CC8A:
	pop {r1}
	bx r1
	.align 2, 0

