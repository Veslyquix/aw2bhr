	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033FFC
sub_08033FFC: @ 0x08033FFC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08034044 @ =gUnknown_0849BC38
	ldrb r2, [r0, #2]
	ldr r3, _08034048 @ =gUnknown_0849BC18
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r1, #1
	lsls r1, r1, #0xc
	str r1, [sp]
	movs r0, #0
	movs r1, #0x60
	bl PutSpriteExt
	ldr r2, [r4, #0x4c]
	cmp r2, #0x78
	bhi _08034036
	ldr r0, _0803404C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08034050
_08034036:
	movs r0, #0
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	bl Proc_Break
	b _08034054
	.align 2, 0
_08034044: .4byte gUnknown_0849BC38
_08034048: .4byte gUnknown_0849BC18
_0803404C: .4byte gpKeySt
_08034050:
	adds r0, r2, #1
	str r0, [r4, #0x4c]
_08034054:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

