	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BFDC
sub_0805BFDC: @ 0x0805BFDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	mov sb, r2
	adds r5, r3, #0
	ldr r0, _0805C09C @ =gUnknown_03003340
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r1]
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r6, _0805C0A0 @ =gUnknown_030033EC
	ldrh r0, [r6]
	ldr r7, _0805C0A4 @ =gUnknown_030040D8
	ldr r1, [r7]
	ldrb r1, [r1]
	bl sub_08042D1C
	lsls r0, r0, #1
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _0805C08A
	ldr r3, _0805C0A8 @ =gUnknown_030013EC
	ldr r1, [r7]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	movs r2, #0
	str r2, [sp]
	ldr r4, [r3]
	mov r2, sb
	movs r3, #0x78
	bl _call_via_r4
	movs r0, #0x79
	bl sub_0801FD9C
	ldrh r0, [r6]
	mov r1, sb
	bl sub_08042D1C
	adds r1, r0, #0
	mov r2, r8
	ldr r0, [r2]
	add r0, sl
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r0, [r6]
	ldr r1, [r7]
	ldrb r1, [r1]
	bl sub_08042D1C
	adds r1, r0, #0
	ldr r2, [sp, #4]
	lsls r0, r2, #2
	bl __divsi3
	lsls r0, r0, #0x10
	lsls r4, r4, #0x10
	cmp r0, r4
	ble _0805C08A
	ldr r3, [r7]
	movs r0, #7
	ands r5, r0
	lsls r2, r5, #3
	ldrb r1, [r3, #9]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #9]
	bl sub_0805FB70
_0805C08A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C09C: .4byte gUnknown_03003340
_0805C0A0: .4byte gUnknown_030033EC
_0805C0A4: .4byte gUnknown_030040D8
_0805C0A8: .4byte gUnknown_030013EC

