	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800272C
sub_0800272C: @ 0x0800272C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r3, [sp, #0x20]
	ldr r1, _08002768 @ =gUnknown_08485C9C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0800276C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _08002770 @ =0x06010000
	adds r2, r0, r1
	movs r0, #0x1f
	ands r0, r6
	cmp r0, #8
	bne _080027A6
	cmp r6, #0x48
	beq _08002788
	cmp r6, #0x48
	bgt _08002774
	cmp r6, #8
	beq _0800277E
	cmp r6, #0x28
	beq _0800277E
	b _080027AE
	.align 2, 0
_08002768: .4byte gUnknown_08485C9C
_0800276C: .4byte 0x000003FF
_08002770: .4byte 0x06010000
_08002774:
	cmp r6, #0x68
	beq _08002792
	cmp r6, #0x88
	beq _0800279C
	b _080027AE
_0800277E:
	movs r0, #8
	movs r1, #1
	bl sub_0803F6BC
	b _080027AE
_08002788:
	movs r0, #8
	movs r1, #2
	bl sub_0803F6BC
	b _080027AE
_08002792:
	movs r0, #8
	movs r1, #3
	bl sub_0803F6BC
	b _080027AE
_0800279C:
	movs r0, #8
	movs r1, #4
	bl sub_0803F6BC
	b _080027AE
_080027A6:
	movs r1, #1
	bl sub_0803F6BC
	adds r5, #8
_080027AE:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _080027F8
	ldr r7, _080027F0 @ =0x000001FF
	mov r0, r8
	ands r7, r0
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _080027C6
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r7, r0
_080027C6:
	movs r0, #0xff
	ands r5, r0
	movs r0, #0xa0
	lsls r0, r0, #3
	orrs r5, r0
	ldr r1, _080027F4 @ =gUnknown_08485CC8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r6, #0
	bl sub_08001D04
	adds r3, r0, #0
	lsls r3, r3, #0xc
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0801BD00
	b _08002830
	.align 2, 0
_080027F0: .4byte 0x000001FF
_080027F4: .4byte gUnknown_08485CC8
_080027F8:
	ldr r7, _0800283C @ =0x000001FF
	mov r0, r8
	ands r7, r0
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0800280A
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r7, r0
_0800280A:
	movs r0, #0xff
	ands r5, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r5, r0
	ldr r1, _08002840 @ =gUnknown_08485CC8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r6, #0
	bl sub_08001D04
	adds r3, r0, #0
	lsls r3, r3, #0xc
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0801BD00
_08002830:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800283C: .4byte 0x000001FF
_08002840: .4byte gUnknown_08485CC8

