	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E2AC
sub_0805E2AC: @ 0x0805E2AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805E394 @ =0x00007FFF
	mov sb, r0
	ldr r0, _0805E398 @ =0xFFFF0000
	ldr r1, [sp, #4]
	ands r1, r0
	ldr r0, _0805E39C @ =0x0000270F
	orrs r1, r0
	str r1, [sp, #4]
	bl sub_08060DAC
	adds r7, r0, #0
	movs r6, #0
	ldr r1, _0805E3A0 @ =gUnknown_0816DA68
	mov sl, r1
	cmp r6, r7
	bge _0805E34A
	ldr r2, _0805E3A4 @ =gUnknown_085766E4
	mov r8, r2
_0805E2DC:
	mov r3, r8
	ldr r0, [r3]
	lsls r5, r6, #2
	adds r1, r5, r0
	ldrb r0, [r1, #2]
	cmp r0, #6
	bne _0805E344
	mov r0, sl
	ldr r3, [r0]
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	movs r2, #0
	str r2, [sp]
	ldr r4, [r3]
	movs r2, #0x17
	movs r3, #0x78
	bl _call_via_r4
	ldr r0, _0805E3A8 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1, #3]
	lsls r0, r0, #2
	ldr r2, _0805E3AC @ =gUnknown_03003340
	adds r0, r0, r2
	ldrb r1, [r1, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r2, r1, #0x10
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _0805E344
	lsrs r2, r2, #0x10
	mov sb, r2
	mov r0, r8
	ldr r2, [r0]
	adds r2, r5, r2
	ldrb r3, [r2]
	ldr r1, _0805E398 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	orrs r0, r3
	str r0, [sp, #4]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x10
	ldr r1, _0805E3B0 @ =0x0000FFFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
_0805E344:
	adds r6, #1
	cmp r6, r7
	blt _0805E2DC
_0805E34A:
	add r0, sp, #4
	ldrh r1, [r0]
	ldr r0, _0805E39C @ =0x0000270F
	cmp r1, r0
	bne _0805E358
	bl sub_0805F7B8
_0805E358:
	ldr r0, _0805E3B4 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _0805E3B8 @ =0x00002D5A
	adds r0, r0, r1
	bl sub_0801F92C
	mov r2, sl
	ldr r3, [r2]
	add r0, sp, #4
	ldrh r0, [r0]
	ldr r1, [sp, #4]
	lsrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	ldr r4, [r3]
	movs r2, #0x17
	movs r3, #0x78
	bl _call_via_r4
	add r0, sp, #4
	bl sub_08059464
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E394: .4byte 0x00007FFF
_0805E398: .4byte 0xFFFF0000
_0805E39C: .4byte 0x0000270F
_0805E3A0: .4byte gUnknown_0816DA68
_0805E3A4: .4byte gUnknown_085766E4
_0805E3A8: .4byte gUnknown_030040D8
_0805E3AC: .4byte gUnknown_03003340
_0805E3B0: .4byte 0x0000FFFF
_0805E3B4: .4byte gUnknown_08499590
_0805E3B8: .4byte 0x00002D5A

