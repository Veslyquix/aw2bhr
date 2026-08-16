	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080455CC
sub_080455CC: @ 0x080455CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r1, #0
	ldr r2, _08045618 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _08045644
	mov r8, r2
_080455E0:
	movs r3, #0
	mov r2, r8
	ldr r0, [r2]
	adds r7, r1, #1
	ldrh r0, [r0]
	cmp r3, r0
	bge _08045638
	ldr r5, _08045618 @ =gUnknown_08499590
	lsls r6, r1, #1
	ldr r4, _0804561C @ =gUnknown_020288B4
	ldr r0, _08045620 @ =0x0000417A
	mov ip, r0
_080455F8:
	ldr r1, [r5]
	mov r2, ip
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r2, r0, r3
	ldr r0, _08045624 @ =0x00001432
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0x10
	bne _08045628
	adds r1, r2, r4
	movs r0, #0x63
	b _0804562C
	.align 2, 0
_08045618: .4byte gUnknown_08499590
_0804561C: .4byte gUnknown_020288B4
_08045620: .4byte 0x0000417A
_08045624: .4byte 0x00001432
_08045628:
	adds r1, r2, r4
	movs r0, #0
_0804562C:
	strb r0, [r1]
	adds r3, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r3, r0
	blt _080455F8
_08045638:
	adds r1, r7, #0
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _080455E0
_08045644:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

