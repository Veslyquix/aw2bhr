	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805653C
sub_0805653C: @ 0x0805653C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r6, #0
	movs r7, #0
	ldr r2, _080565A4 @ =gUnknown_085D6A48
	ldr r0, _080565A8 @ =gUnknown_03004580
	lsls r1, r4, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	cmp r0, #1
	bne _080565B8
	ldr r1, _080565AC @ =gUnknown_08552148
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r5, #0
	ldr r2, _080565B0 @ =gUnknown_02029A10
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r0, r2
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0805661A
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805661A
	ldr r0, _080565B4 @ =gUnknown_02029808
	movs r1, #0x6c
	muls r1, r4, r1
	adds r0, #2
	adds r1, r1, r0
	strh r3, [r1]
	movs r5, #1
	b _0805661A
	.align 2, 0
_080565A4: .4byte gUnknown_085D6A48
_080565A8: .4byte gUnknown_03004580
_080565AC: .4byte gUnknown_08552148
_080565B0: .4byte gUnknown_02029A10
_080565B4: .4byte gUnknown_02029808
_080565B8:
	cmp r6, r5
	beq _0805661A
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	mov r8, r0
	ldr r0, _0805662C @ =gUnknown_02029A10
	mov sl, r0
	ldr r1, _08056630 @ =gUnknown_0202980A
	mov sb, r1
	movs r0, #0xb4
	adds r2, r4, #0
	muls r2, r0, r2
	mov ip, r2
	movs r0, #0x6c
	adds r1, r4, #0
	muls r1, r0, r1
_080565DA:
	lsls r0, r7, #2
	add r0, r8
	ldr r4, _08056634 @ =gUnknown_0855218C
	adds r0, r0, r4
	ldrh r3, [r0]
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, ip
	mov r4, sl
	adds r2, r0, r4
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0805660A
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805660A
	lsls r0, r6, #1
	adds r0, r0, r1
	add r0, sb
	strh r3, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0805660A:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bne _08056616
	adds r6, r5, #0
_08056616:
	cmp r6, r5
	bne _080565DA
_0805661A:
	adds r0, r5, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805662C: .4byte gUnknown_02029A10
_08056630: .4byte gUnknown_0202980A
_08056634: .4byte gUnknown_0855218C

