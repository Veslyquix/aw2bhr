	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C9A4
sub_0802C9A4: @ 0x0802C9A4
	push {lr}
	ldr r0, _0802C9D4 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0802C9E0
	bl sub_0802C958
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C9E0
	ldr r0, _0802C9D8 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _0802C9DC @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	cmp r0, #4
	bne _0802C9E0
	movs r0, #0
	b _0802C9E2
	.align 2, 0
_0802C9D4: .4byte gUnknown_03003FC0
_0802C9D8: .4byte gUnknown_030033EC
_0802C9DC: .4byte gUnknown_08499598
_0802C9E0:
	movs r0, #1
_0802C9E2:
	pop {r1}
	bx r1
	.align 2, 0

