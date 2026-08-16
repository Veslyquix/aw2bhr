	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A218
sub_0806A218: @ 0x0806A218
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0x94
	lsls r0, r0, #1
	subs r1, r0, r1
	cmp r1, #0xc4
	beq _0806A254
	cmp r1, #0xc4
	bgt _0806A238
	cmp r1, #0
	beq _0806A248
	cmp r1, #0x62
	beq _0806A24E
	b _0806A2CE
_0806A238:
	movs r0, #0x8e
	lsls r0, r0, #1
	cmp r1, r0
	beq _0806A262
	adds r0, #1
	cmp r1, r0
	beq _0806A2AC
	b _0806A2CE
_0806A248:
	movs r0, #0
	movs r1, #1
	b _0806A258
_0806A24E:
	movs r0, #1
	movs r1, #4
	b _0806A258
_0806A254:
	movs r0, #0
	movs r1, #2
_0806A258:
	movs r2, #0x61
	adds r3, r4, #0
	bl sub_08069FAC
	b _0806A2CE
_0806A262:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0806A294 @ =0x0600D000
	ldr r2, _0806A298 @ =0x01000400
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0806A29C @ =gUnknown_0817C3E8
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0806A2A0 @ =gUnknown_081866F8
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_08011CAC
	ldr r0, _0806A2A4 @ =gUnknown_08186D4C
	ldr r1, _0806A2A8 @ =gUnknown_08499578
	ldr r1, [r1]
	bl sub_08011CAC
	bl sub_08013AEC
	b _0806A2CE
	.align 2, 0
_0806A294: .4byte 0x0600D000
_0806A298: .4byte 0x01000400
_0806A29C: .4byte gUnknown_0817C3E8
_0806A2A0: .4byte gUnknown_081866F8
_0806A2A4: .4byte gUnknown_08186D4C
_0806A2A8: .4byte gUnknown_08499578
_0806A2AC:
	ldr r2, _0806A2DC @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _0806A2E0 @ =gUnknown_085814E8
	adds r1, r4, #0
	bl Proc_Start
_0806A2CE:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0806A2E4
	subs r0, #1
	str r0, [r4, #0x2c]
	b _0806A2EE
	.align 2, 0
_0806A2DC: .4byte gUnknown_030030CC
_0806A2E0: .4byte gUnknown_085814E8
_0806A2E4:
	adds r0, r4, #0
	bl Proc_Break
	bl sub_08067820
_0806A2EE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

