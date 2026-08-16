	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021810
sub_08021810: @ 0x08021810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r3, _08021854 @ =gUnknown_03003FC0
	ldrb r0, [r3, #2]
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bhi _0802185C
	ldr r2, _08021858 @ =gUnknown_020280C0
	ldrb r1, [r3, #2]
	subs r1, #0xb4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x19]
	mov r1, r8
	strb r0, [r1]
	ldrb r1, [r3, #2]
	subs r1, #0xb4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	mov r2, sb
	strb r0, [r2]
	b _08021996
	.align 2, 0
_08021854: .4byte gUnknown_03003FC0
_08021858: .4byte gUnknown_020280C0
_0802185C:
	ldrb r0, [r3, #2]
	bl sub_0802163C
	movs r3, #0
	ldr r4, _08021880 @ =gUnknown_0809096C
	mov ip, r4
	ldr r5, _08021884 @ =gUnknown_08090970
	ldr r2, [r4]
	movs r1, #0
_0802186E:
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _0802186E
	movs r6, #0
	b _0802194E
	.align 2, 0
_08021880: .4byte gUnknown_0809096C
_08021884: .4byte gUnknown_08090970
_08021888:
	movs r3, #0
	ldr r0, [r1]
	ldr r0, [r0]
	adds r7, r6, #1
	mov sl, r7
	b _08021942
_08021894:
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r4, _080218C4 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r7, _080218C8 @ =0x00001432
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #6
	adds r4, r2, #0
	cmp r0, #0xe
	bhi _08021936
	lsls r0, r0, #2
	ldr r1, _080218CC @ =_080218D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080218C4: .4byte 0x0000417A
_080218C8: .4byte 0x00001432
_080218CC: .4byte _080218D0
_080218D0: @ jump table
	.4byte _0802190C @ case 0
	.4byte _08021936 @ case 1
	.4byte _0802190C @ case 2
	.4byte _08021936 @ case 3
	.4byte _0802190C @ case 4
	.4byte _0802190C @ case 5
	.4byte _08021936 @ case 6
	.4byte _08021936 @ case 7
	.4byte _0802190C @ case 8
	.4byte _08021936 @ case 9
	.4byte _08021936 @ case 10
	.4byte _08021936 @ case 11
	.4byte _08021936 @ case 12
	.4byte _08021936 @ case 13
	.4byte _0802190C @ case 14
_0802190C:
	mov r0, ip
	ldr r2, [r0]
	ldrb r0, [r2, #5]
	adds r0, #1
	strb r0, [r2, #5]
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r7, _080219A4 @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r4, _080219A8 @ =0x00001432
	adds r1, r1, r4
	adds r1, r1, r0
	ldrb r1, [r1]
	lsrs r1, r1, #5
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08021936:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r1, r5, #0
	ldr r0, [r5]
	ldr r0, [r0]
_08021942:
	ldrh r0, [r0]
	cmp r3, r0
	blo _08021894
	mov r7, sl
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
_0802194E:
	adds r1, r5, #0
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blo _08021888
	mov r0, ip
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1]
	movs r3, #0
_08021964:
	adds r0, r3, r1
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r0, r2
	bhs _08021970
	strb r2, [r1]
_08021970:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #4
	bls _08021964
	mov r2, ip
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	mov r4, r8
	strb r0, [r4]
	ldrb r0, [r1]
	ldrb r7, [r1, #5]
	cmp r0, r7
	bhs _08021990
	adds r0, #1
	strb r0, [r1]
_08021990:
	ldrb r0, [r1]
	mov r1, sb
	strb r0, [r1]
_08021996:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080219A4: .4byte 0x0000417A
_080219A8: .4byte 0x00001432

