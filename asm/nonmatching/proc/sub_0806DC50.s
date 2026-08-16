	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DC50
sub_0806DC50: @ 0x0806DC50
	push {r4, lr}
	ldr r1, _0806DCB4 @ =gUnknown_08580934
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r1, #0x54
	adds r1, r1, r0
	ldr r4, [r1]
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #1
	beq _0806DC72
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806DC82
_0806DC72:
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r0, #9
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	subs r1, #0x10
	bl sub_0806CFC8
_0806DC82:
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #1
	beq _0806DC9C
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r1, [r0]
	adds r0, #3
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0806DCAC
_0806DC9C:
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r0, #9
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	adds r1, #0x1f
	bl sub_0806D050
_0806DCAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DCB4: .4byte gUnknown_08580934

