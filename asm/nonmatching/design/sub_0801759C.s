	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801759C
sub_0801759C: @ 0x0801759C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r2, _08017630 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0801760C
	mov sb, r2
_080175B4:
	movs r3, #0
	mov r2, sb
	ldr r0, [r2]
	adds r6, r1, #1
	mov sl, r6
	ldrh r0, [r0]
	cmp r3, r0
	bge _08017600
	ldr r4, _08017630 @ =gUnknown_08499590
	lsls r5, r1, #1
	ldr r0, _08017634 @ =gUnknown_0849959C
	mov r8, r0
	ldr r2, _08017638 @ =0x0000417A
	mov ip, r2
	ldr r7, _0801763C @ =0x00001432
_080175D2:
	ldr r1, [r4]
	mov r6, ip
	adds r0, r1, r6
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r3
	adds r2, r1, r7
	adds r2, r2, r0
	lsls r0, r0, #1
	ldr r6, _08017640 @ =0x00000A22
	adds r1, r1, r6
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r6, r8
	ldr r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r3, r0
	blt _080175D2
_08017600:
	mov r1, sl
	mov r2, sb
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _080175B4
_0801760C:
	bl sub_080215B8
	bl sub_08023348
	bl sub_08024268
	ldr r0, _08017644 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0801A548
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017630: .4byte gUnknown_08499590
_08017634: .4byte gUnknown_0849959C
_08017638: .4byte 0x0000417A
_0801763C: .4byte 0x00001432
_08017640: .4byte 0x00000A22
_08017644: .4byte gUnknown_030033EC

