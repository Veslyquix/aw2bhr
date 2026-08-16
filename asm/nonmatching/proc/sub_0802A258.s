	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A258
sub_0802A258: @ 0x0802A258
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802A2D4 @ =gUnknown_084995A8
	ldrb r1, [r4]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802A2DC
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0802A27C
	subs r0, #1
	ldrb r1, [r4, #3]
	bl sub_0802A1E4
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802A2CE
_0802A27C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802A292
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	subs r1, #1
	bl sub_0802A1E4
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802A2CE
_0802A292:
	ldrb r2, [r4, #2]
	ldr r1, _0802A2D8 @ =gUnknown_08090B7C
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	adds r5, r1, #0
	cmp r2, r0
	bge _0802A2B2
	adds r0, r2, #1
	ldrb r1, [r4, #3]
	bl sub_0802A1E4
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802A2CE
_0802A2B2:
	ldrb r1, [r4, #3]
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r1, r0
	bge _0802A2DC
	ldrb r0, [r4, #2]
	adds r1, #1
	bl sub_0802A1E4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0802A2DC
_0802A2CE:
	movs r0, #1
	b _0802A2DE
	.align 2, 0
_0802A2D4: .4byte gUnknown_084995A8
_0802A2D8: .4byte gUnknown_08090B7C
_0802A2DC:
	movs r0, #0
_0802A2DE:
	pop {r4, r5}
	pop {r1}
	bx r1

