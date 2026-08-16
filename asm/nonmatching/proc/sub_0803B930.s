	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B930
sub_0803B930: @ 0x0803B930
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0803B97C @ =gUnknown_0849ECDC
	ldr r0, [r0]
	strb r3, [r0]
	movs r2, #1
	ldr r4, _0803B980 @ =gUnknown_03003FF8
	movs r1, #0
_0803B942:
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _0803B942
	movs r2, #1
	cmp r2, r3
	bhi _0803B99A
	ldr r0, _0803B984 @ =gUnknown_03003FC0
	ldr r1, _0803B988 @ =gUnknown_0849EA78
	mov ip, r1
	adds r7, r0, #0
	adds r7, #0x38
	adds r6, r0, #0
	adds r6, #0x3d
	adds r5, r0, #0
	adds r5, #0x39
	movs r4, #2
_0803B96A:
	adds r0, r2, r6
	subs r1, r2, #1
	add r1, ip
	ldrb r1, [r1]
	strb r1, [r0]
	cmp r2, #1
	bne _0803B98C
	strb r2, [r5]
	b _0803B990
	.align 2, 0
_0803B97C: .4byte gUnknown_0849ECDC
_0803B980: .4byte gUnknown_03003FF8
_0803B984: .4byte gUnknown_03003FC0
_0803B988: .4byte gUnknown_0849EA78
_0803B98C:
	adds r0, r2, r7
	strb r4, [r0]
_0803B990:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r3
	bls _0803B96A
_0803B99A:
	bl sub_0803B8C4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

