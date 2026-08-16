	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080030BC
sub_080030BC: @ 0x080030BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _080030EC @ =gUnknown_0808D754
	mov r0, sp
	movs r2, #8
	bl sub_0808B6E8
	ldr r1, _080030F0 @ =gUnknown_0808D75C
	ldr r2, [r1]
	ldr r0, [r2]
	mov ip, r0
	adds r0, #0x72
	adds r4, r0, r5
	ldrb r0, [r4]
	adds r6, r1, #0
	cmp r0, #0xa
	beq _0800313C
	cmp r0, #0xa
	bgt _080030F4
	cmp r0, #0
	beq _08003100
	lsls r2, r5, #1
	b _080031D4
	.align 2, 0
_080030EC: .4byte gUnknown_0808D754
_080030F0: .4byte gUnknown_0808D75C
_080030F4:
	cmp r0, #0x14
	beq _0800317C
	cmp r0, #0x1e
	beq _08003196
	lsls r2, r5, #1
	b _080031D4
_08003100:
	mov r1, ip
	movs r3, #0x3e
	ldrsh r0, [r1, r3]
	movs r1, #0x32
	cmp r0, #0
	beq _0800310E
	movs r1, #0xa
_0800310E:
	strb r1, [r4]
	ldr r3, [r2]
	lsls r2, r5, #1
	adds r0, r3, #0
	adds r0, #0x82
	adds r0, r0, r2
	movs r1, #0x8c
	lsls r1, r1, #5
	strh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x7a
	adds r1, r0, r2
	movs r4, #0x3e
	ldrsh r0, [r3, r4]
	adds r3, r5, #0
	cmp r0, #0
	bne _08003132
	adds r3, r5, #4
_08003132:
	mov r7, sp
	adds r0, r7, r3
	ldrb r0, [r0]
	strh r0, [r1]
	b _080031D4
_0800313C:
	lsls r2, r5, #1
	mov r1, ip
	adds r1, #0x7a
	adds r1, r1, r2
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080031D4
	mov r0, ip
	adds r0, #0x82
	adds r3, r0, r2
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #0xbe
	lsls r0, r0, #4
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xcc
	lsls r1, r1, #4
	cmp r0, r1
	bgt _080031D4
	strh r1, [r3]
	movs r0, #0x14
	strb r0, [r4]
	b _080031D4
_0800317C:
	mov r2, ip
	movs r3, #0x3e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0800318E
	ldrh r0, [r2, #4]
	lsls r2, r5, #1
	cmp r0, #1
	beq _080031D4
_0800318E:
	movs r0, #0x1e
	strb r0, [r4]
	lsls r2, r5, #1
	b _080031D4
_08003196:
	lsls r2, r5, #1
	mov r0, ip
	adds r0, #0x82
	adds r3, r0, r2
	movs r7, #0
	ldrsh r1, [r3, r7]
	movs r0, #0x8c
	lsls r0, r0, #5
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r0, r0, #0x10
	ldr r1, _080031F4 @ =0x10DF0000
	cmp r0, r1
	ble _080031D4
	movs r0, #0x87
	lsls r0, r0, #5
	strh r0, [r3]
	mov r3, ip
	ldrh r0, [r3, #4]
	cmp r0, #1
	bne _080031D4
	movs r7, #0x3e
	ldrsh r0, [r3, r7]
	movs r1, #0
	cmp r0, #0
	bne _080031D2
	movs r1, #0x32
_080031D2:
	strb r1, [r4]
_080031D4:
	ldr r3, [r6]
	ldr r0, [r3]
	mov ip, r0
	adds r0, #0x72
	adds r4, r0, r5
	ldrb r0, [r4]
	cmp r0, #0x46
	beq _08003278
	cmp r0, #0x46
	bgt _080031F8
	cmp r0, #0x32
	beq _080031FE
	cmp r0, #0x3c
	beq _0800323C
	b _080032C6
	.align 2, 0
_080031F4: .4byte 0x10DF0000
_080031F8:
	cmp r0, #0x50
	beq _0800328E
	b _080032C6
_080031FE:
	mov r1, ip
	movs r7, #0x3e
	ldrsh r0, [r1, r7]
	movs r1, #0
	cmp r0, #0
	bne _0800320C
	movs r1, #0x3c
_0800320C:
	strb r1, [r4]
	ldr r3, [r3]
	adds r0, r3, #0
	adds r0, #0x82
	adds r0, r0, r2
	ldr r1, _08003238 @ =0x0000FD80
	strh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x7a
	adds r4, r0, r2
	movs r1, #0x3e
	ldrsh r0, [r3, r1]
	adds r1, r5, #0
	cmp r0, #0
	bne _0800322C
	adds r1, r5, #4
_0800322C:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	strh r0, [r4]
	b _080032C6
	.align 2, 0
_08003238: .4byte 0x0000FD80
_0800323C:
	mov r1, ip
	adds r1, #0x7a
	adds r1, r1, r2
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080032C6
	mov r0, ip
	adds r0, #0x82
	adds r3, r0, r2
	movs r7, #0
	ldrsh r1, [r3, r7]
	movs r0, #0xa0
	lsls r0, r0, #1
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080032C6
	movs r0, #0x20
	strh r0, [r3]
	movs r0, #0x46
	strb r0, [r4]
	b _080032C6
_08003278:
	mov r3, ip
	movs r7, #0x3e
	ldrsh r0, [r3, r7]
	cmp r0, #0
	bne _08003288
	ldrh r0, [r3, #4]
	cmp r0, #1
	beq _080032C6
_08003288:
	movs r0, #0x50
	strb r0, [r4]
	b _080032C6
_0800328E:
	mov r0, ip
	adds r0, #0x82
	adds r3, r0, r2
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, _080032E4 @ =0xFFFFFC60
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080032E8 @ =0xFFFFFD80
	cmp r0, r1
	bgt _080032C6
	strh r1, [r3]
	mov r3, ip
	ldrh r0, [r3, #4]
	cmp r0, #1
	bne _080032C6
	movs r7, #0x3e
	ldrsh r0, [r3, r7]
	movs r1, #0
	cmp r0, #0
	bne _080032C4
	movs r1, #0x32
_080032C4:
	strb r1, [r4]
_080032C6:
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x82
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r0, r5, #0
	movs r2, #0x6a
	bl sub_080032EC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080032E4: .4byte 0xFFFFFC60
_080032E8: .4byte 0xFFFFFD80

