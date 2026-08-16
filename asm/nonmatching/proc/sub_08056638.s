	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08056638
sub_08056638: @ 0x08056638
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0
	movs r1, #0x6c
	adds r3, r0, #0
	muls r3, r1, r3
	mov r8, r3
	ldr r0, _080566C0 @ =gUnknown_02029822
	mov sb, r0
_08056654:
	movs r1, #0
	adds r2, #1
	mov sl, r2
_0805665A:
	lsls r0, r1, #1
	mov r2, r8
	adds r7, r0, r2
	mov r3, sb
	adds r6, r7, r3
	ldrh r3, [r6]
	adds r1, #1
	lsls r0, r1, #1
	adds r5, r0, r2
	mov r0, sb
	adds r4, r5, r0
	ldrh r2, [r4]
	mov ip, r1
	cmp r3, #0xff
	beq _0805669C
	cmp r2, #0xff
	beq _0805669C
	cmp r3, r2
	bne _08056686
	adds r0, r2, #1
	strh r0, [r4]
	ldrh r2, [r4]
_08056686:
	cmp r3, r2
	bls _0805669C
	strh r3, [r4]
	strh r2, [r6]
	ldr r2, _080566C4 @ =gUnknown_0202980A
	adds r1, r7, r2
	ldrh r3, [r1]
	adds r0, r5, r2
	ldrh r2, [r0]
	strh r3, [r0]
	strh r2, [r1]
_0805669C:
	mov r3, ip
	lsls r0, r3, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #3
	bls _0805665A
	mov r1, sl
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #3
	bls _08056654
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080566C0: .4byte gUnknown_02029822
_080566C4: .4byte gUnknown_0202980A

