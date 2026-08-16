	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E9DC
sub_0805E9DC: @ 0x0805E9DC
	push {r4, lr}
	sub sp, #8
	ldr r0, _0805EA40 @ =gUnknown_0816DA88
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0805EA44 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _0805EA48 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r4, _0805EA4C @ =gUnknown_030040D8
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	movs r0, #0xf8
	ands r0, r1
	cmp r0, #0
	bne _0805EA36
	ldrb r1, [r2, #9]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0805EA36
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #2
	bhi _0805EA36
	ldr r2, _0805EA50 @ =gUnknown_030045CC
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	bl sub_0805EA54
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	subs r0, #4
	add r0, sp
	ldr r0, [r0]
	bl _call_via_r0
_0805EA36:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EA40: .4byte gUnknown_0816DA88
_0805EA44: .4byte gUnknown_08499590
_0805EA48: .4byte 0x00002852
_0805EA4C: .4byte gUnknown_030040D8
_0805EA50: .4byte gUnknown_030045CC

