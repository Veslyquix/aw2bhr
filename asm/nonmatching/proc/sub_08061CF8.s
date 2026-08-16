	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061CF8
sub_08061CF8: @ 0x08061CF8
	push {r4, r5, r6, lr}
	ldr r4, _08061D9C @ =gUnknown_03004788
	movs r0, #0
	str r0, [r4]
	ldr r6, _08061DA0 @ =gUnknown_030033EC
	ldrh r1, [r6]
	ldr r5, _08061DA4 @ =gUnknown_08499598
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08061D28
	movs r0, #1
	bl sub_08061DA8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
_08061D28:
	ldrh r1, [r6]
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08061D4C
	movs r0, #2
	bl sub_08061DA8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
_08061D4C:
	ldrh r1, [r6]
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08061D70
	movs r0, #3
	bl sub_08061DA8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
_08061D70:
	ldrh r1, [r6]
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061D94
	movs r0, #4
	bl sub_08061DA8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
_08061D94:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061D9C: .4byte gUnknown_03004788
_08061DA0: .4byte gUnknown_030033EC
_08061DA4: .4byte gUnknown_08499598

