	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080590DC
sub_080590DC: @ 0x080590DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r2, r0, #0
	movs r0, #0x78
	mov r8, r0
	ldr r1, _08059170 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r1, _08059174 @ =0x0000270F
	orrs r0, r1
	str r0, [sp, #4]
	ldr r3, _08059178 @ =gUnknown_030013EC
	ldrh r0, [r2]
	ldrh r1, [r2, #2]
	movs r2, #0
	str r2, [sp]
	ldr r4, [r3]
	movs r2, #0x10
	movs r3, #7
	bl _call_via_r4
	movs r2, #0
	ldr r0, _0805917C @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r1, [r3, #2]
	cmp r2, r1
	bge _080591B8
	mov ip, r0
	adds r6, r3, #0
	ldr r7, _08059180 @ =gUnknown_03003340
	mov sb, r7
_08059122:
	movs r3, #0
	adds r0, r2, #1
	mov sl, r0
	ldrh r1, [r6]
	cmp r3, r1
	bge _080591B0
	lsls r0, r2, #2
	mov r7, sb
	adds r4, r0, r7
	lsls r5, r2, #1
	lsls r2, r2, #0x10
_08059138:
	ldr r0, [r4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080591A4
	cmp r0, r8
	bge _080591A4
	mov r0, ip
	ldr r1, [r0]
	ldr r7, _08059184 @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r7, _08059188 @ =0x00001432
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0xb
	beq _08059190
	cmp r1, #0xb
	bgt _0805918C
	cmp r1, #7
	beq _08059190
	b _080591A4
	.align 2, 0
_08059170: .4byte 0xFFFF0000
_08059174: .4byte 0x0000270F
_08059178: .4byte gUnknown_030013EC
_0805917C: .4byte gUnknown_08499590
_08059180: .4byte gUnknown_03003340
_08059184: .4byte 0x0000417A
_08059188: .4byte 0x00001432
_0805918C:
	cmp r1, #0xd
	bne _080591A4
_08059190:
	ldr r0, [r4]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r2
	str r0, [sp, #4]
_080591A4:
	adds r3, #1
	mov r1, ip
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r3, r0
	blt _08059138
_080591B0:
	mov r2, sl
	ldrh r7, [r6, #2]
	cmp r2, r7
	blt _08059122
_080591B8:
	add r0, sp, #4
	ldrh r1, [r0]
	ldr r0, _080591CC @ =0x0000270F
	cmp r1, r0
	beq _080591D0
	add r0, sp, #4
	bl sub_080591E4
	b _080591D4
	.align 2, 0
_080591CC: .4byte 0x0000270F
_080591D0:
	bl sub_0805F7B8
_080591D4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

