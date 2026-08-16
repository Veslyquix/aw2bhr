	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805D344
sub_0805D344: @ 0x0805D344
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	movs r0, #0
	mov r8, r0
	ldr r1, _0805D3D0 @ =gUnknown_030045F0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805D38C
	ldr r5, _0805D3D4 @ =gUnknown_08499594
	adds r4, r1, #0
_0805D362:
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r1, r1, r0
	ldr r0, _0805D3D8 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r1]
	bl sub_08042D1C
	ldr r1, _0805D3DC @ =gUnknown_030046E0
	add r1, r8
	ldrb r2, [r1]
	strb r0, [r1]
	adds r4, #1
	movs r1, #1
	add r8, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805D362
_0805D38C:
	mov r2, r8
	cmp r2, #1
	ble _0805D426
	mov r0, r8
	movs r1, #0
	mov r8, r1
	subs r0, #2
	cmp r8, r0
	bgt _0805D426
	str r0, [sp, #4]
_0805D3A0:
	adds r7, r0, #0
	mov r2, r8
	adds r2, #1
	str r2, [sp, #8]
	cmp r0, r8
	blt _0805D41C
	ldr r1, _0805D3DC @ =gUnknown_030046E0
	mov sb, r1
	ldr r2, _0805D3D0 @ =gUnknown_030045F0
	mov sl, r2
	adds r5, r0, r1
	adds r0, #1
	add r0, sb
	mov ip, r0
_0805D3BC:
	ldr r0, [sp]
	cmp r0, #0
	bne _0805D3E0
	ldrb r1, [r5]
	mov r2, ip
	ldrb r0, [r2]
	adds r6, r7, #1
	cmp r1, r0
	blo _0805D3EC
	b _0805D40E
	.align 2, 0
_0805D3D0: .4byte gUnknown_030045F0
_0805D3D4: .4byte gUnknown_08499594
_0805D3D8: .4byte gUnknown_030033EC
_0805D3DC: .4byte gUnknown_030046E0
_0805D3E0:
	ldrb r1, [r5]
	mov r2, ip
	ldrb r0, [r2]
	adds r6, r7, #1
	cmp r1, r0
	bls _0805D40E
_0805D3EC:
	ldrb r3, [r5]
	mov r1, sb
	adds r0, r6, r1
	ldrb r1, [r0]
	ldrb r2, [r5]
	strb r1, [r5]
	ldrb r1, [r0]
	strb r3, [r0]
	mov r2, sl
	adds r1, r7, r2
	ldrb r4, [r1]
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r3, [r1]
	strb r2, [r1]
	ldrb r1, [r0]
	strb r4, [r0]
_0805D40E:
	subs r5, #1
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	subs r7, #1
	cmp r7, r8
	bge _0805D3BC
_0805D41C:
	ldr r1, [sp, #8]
	mov r8, r1
	ldr r0, [sp, #4]
	cmp r8, r0
	ble _0805D3A0
_0805D426:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

