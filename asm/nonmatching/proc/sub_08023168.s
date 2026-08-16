	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023168
sub_08023168: @ 0x08023168
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r3
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r2, _08023194 @ =gUnknown_080909EC
	ldr r1, [r2]
	ldrh r4, [r1]
	ldrh r3, [r1, #2]
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r0, r4
	mov r8, r2
	cmp r1, #0
	blt _08023198
	lsls r6, r5, #0x10
	cmp r1, #0x10
	bgt _080231B8
	b _080231A0
	.align 2, 0
_08023194: .4byte gUnknown_080909EC
_08023198:
	subs r0, r4, r0
	lsls r6, r5, #0x10
	cmp r0, #0x10
	bgt _080231B8
_080231A0:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	subs r1, r2, r3
	adds r6, r0, #0
	cmp r1, #0
	blt _080231B2
	cmp r1, #0x10
	bgt _080231B8
	b _080231BE
_080231B2:
	subs r0, r3, r2
	cmp r0, #0x10
	ble _080231BE
_080231B8:
	adds r4, r7, #0
	lsrs r3, r6, #0x10
	b _08023222
_080231BE:
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	subs r1, r2, r4
	adds r5, r0, #0
	cmp r1, #0
	blt _080231D0
	cmp r1, #0
	bgt _080231D6
	b _080231F2
_080231D0:
	subs r0, r4, r2
	cmp r0, #0
	ble _080231F2
_080231D6:
	asrs r0, r5, #0x10
	subs r0, r0, r4
	cmp r0, #0
	bgt _080231EA
	cmp r0, #0
	bge _080231E6
	subs r0, r4, #4
	b _080231EC
_080231E6:
	lsls r0, r4, #0x10
	b _080231EE
_080231EA:
	adds r0, r4, #4
_080231EC:
	lsls r0, r0, #0x10
_080231EE:
	lsrs r0, r0, #0x10
	adds r4, r0, #0
_080231F2:
	asrs r1, r6, #0x10
	subs r0, r1, r3
	cmp r0, #0
	blt _08023200
	cmp r0, #0
	bgt _08023206
	b _08023222
_08023200:
	subs r0, r3, r1
	cmp r0, #0
	ble _08023222
_08023206:
	asrs r0, r6, #0x10
	subs r0, r0, r3
	cmp r0, #0
	bgt _0802321A
	cmp r0, #0
	bge _08023216
	subs r0, r3, #4
	b _0802321C
_08023216:
	lsls r0, r3, #0x10
	b _0802321E
_0802321A:
	adds r0, r3, #4
_0802321C:
	lsls r0, r0, #0x10
_0802321E:
	lsrs r0, r0, #0x10
	adds r3, r0, #0
_08023222:
	mov r1, r8
	ldr r0, [r1]
	strh r4, [r0]
	strh r3, [r0, #2]
	mov r0, ip
	strh r4, [r0]
	ldr r0, [sp, #0x18]
	strh r3, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

