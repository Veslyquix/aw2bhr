	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055768
sub_08055768: @ 0x08055768
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r3, #0
	movs r4, #0
	cmp r6, #0
	bne _08055786
	b _08055918
_08055786:
	ldr r2, _08055804 @ =gUnknown_085D6A48
	ldr r0, _08055808 @ =gUnknown_03004580
	lsls r1, r5, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	cmp r0, #1
	bne _0805581C
	cmp r4, r6
	bne _080557A6
	b _080558AE
_080557A6:
	lsls r0, r5, #2
	adds r7, r0, r5
	lsls r0, r7, #3
	mov sb, r0
	ldr r1, _0805580C @ =gUnknown_020296BC
	mov sl, r1
	movs r0, #0xb4
	adds r2, r5, #0
	muls r2, r0, r2
	mov r8, r2
	ldr r1, _08055810 @ =gUnknown_08552148
	lsls r0, r5, #1
	adds r0, r0, r1
	mov ip, r0
_080557C2:
	adds r0, r7, r4
	lsls r0, r0, #2
	ldr r1, _08055814 @ =gUnknown_08552150
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, r8
	ldr r2, _08055818 @ =gUnknown_02029A10
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080557F0
	lsls r0, r3, #1
	add r0, sb
	add r0, sl
	mov r2, ip
	ldrh r1, [r2]
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080557F0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bne _080557FC
	adds r3, r6, #0
_080557FC:
	cmp r3, r6
	bne _080557C2
	b _080558AE
	.align 2, 0
_08055804: .4byte gUnknown_085D6A48
_08055808: .4byte gUnknown_03004580
_0805580C: .4byte gUnknown_020296BC
_08055810: .4byte gUnknown_08552148
_08055814: .4byte gUnknown_08552150
_08055818: .4byte gUnknown_02029A10
_0805581C:
	cmp r4, r6
	beq _080558AE
	lsls r0, r5, #2
	adds r0, r0, r5
	str r0, [sp]
	ldr r7, _08055864 @ =gUnknown_02029A10
	mov sb, r7
	movs r0, #0xb4
	adds r1, r5, #0
	muls r1, r0, r1
	mov ip, r1
	ldr r2, _08055868 @ =gUnknown_0300450C
	mov sl, r2
	ldr r7, _0805586C @ =gUnknown_020296BC
	mov r8, r7
_0805583A:
	ldr r1, [sp]
	adds r0, r1, r4
	lsls r0, r0, #2
	ldr r2, _08055870 @ =gUnknown_08552150
	adds r0, r0, r2
	ldrh r2, [r0]
	mov r7, sl
	ldrh r7, [r7]
	cmp r5, r7
	bne _08055874
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, ip
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805589E
	lsls r0, r3, #1
	lsls r1, r1, #3
	b _08055892
	.align 2, 0
_08055864: .4byte gUnknown_02029A10
_08055868: .4byte gUnknown_0300450C
_0805586C: .4byte gUnknown_020296BC
_08055870: .4byte gUnknown_08552150
_08055874:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, ip
	mov r7, sb
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805589E
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _0805589E
	lsls r0, r3, #1
	ldr r7, [sp]
	lsls r1, r7, #3
_08055892:
	adds r0, r0, r1
	add r0, r8
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0805589E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bne _080558AA
	adds r3, r6, #0
_080558AA:
	cmp r3, r6
	bne _0805583A
_080558AE:
	ldr r0, _08055928 @ =gUnknown_08551E64
	ldr r3, _0805592C @ =gUnknown_030045A0
	ldr r2, _08055930 @ =gUnknown_0300450C
	ldrh r1, [r2]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	mov r8, r1
	movs r4, #0
	cmp r4, r6
	bhs _08055918
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	mov ip, r0
	lsls r5, r5, #1
	mov sl, r2
	adds r7, r5, r3
	ldr r0, _08055934 @ =gUnknown_08551D26
	mov sb, r0
_080558DC:
	lsls r3, r4, #1
	add r3, ip
	ldr r1, _08055938 @ =gUnknown_020296CE
	adds r3, r3, r1
	mov r2, sl
	ldrh r0, [r2]
	adds r0, r5, r0
	lsls r0, r0, #1
	ldr r1, _0805593C @ =gUnknown_08551E74
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r1, r1, r4
	lsls r1, r1, #1
	add r1, r8
	ldrh r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blo _080558DC
_08055918:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055928: .4byte gUnknown_08551E64
_0805592C: .4byte gUnknown_030045A0
_08055930: .4byte gUnknown_0300450C
_08055934: .4byte gUnknown_08551D26
_08055938: .4byte gUnknown_020296CE
_0805593C: .4byte gUnknown_08551E74

